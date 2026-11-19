import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_filled_button.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebViewParam {
  AppWebViewParam({
    required this.url,
    required this.title,
    this.postParameters,
    this.successUrl,
    this.failureUrl,
    this.allowedHosts = const [],
    this.enableJavaScript = true,
    this.wrapInScaffold = true,
  });

  final String url;
  final String? title;
  final Map<String, String>? postParameters;
  final String? successUrl;
  final String? failureUrl;
  final List<String> allowedHosts;
  final bool enableJavaScript;
  final bool wrapInScaffold;
}

class AppWebView extends StatefulWidget {
  const AppWebView({required this.param, super.key});
  final AppWebViewParam param;
  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  bool _canGoBack = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    unawaited(initializeWebView());
  }

  @override
  void didUpdateWidget(covariant AppWebView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final parametersChanged =
        oldWidget.param.url != widget.param.url ||
        !mapEquals(
          oldWidget.param.postParameters,
          widget.param.postParameters,
        ) ||
        !listEquals(oldWidget.param.allowedHosts, widget.param.allowedHosts);
    if (parametersChanged) unawaited(loadInitialPage());
  }

  Future<void> initializeWebView() async {
    try {
      await _controller.setJavaScriptMode(
        widget.param.enableJavaScript
            ? JavaScriptMode.unrestricted
            : JavaScriptMode.disabled,
      );
      await _controller.setBackgroundColor(AppColors.white);
      await _controller.setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (!mounted) return;
            setState(() {
              _isLoading = true;
              _hasError = false;
            });
          },
          onPageFinished: (_) {
            if (!mounted) return;
            setState(() {
              _isLoading = false;
              _hasError = false;
            });
            unawaited(refreshCanGoBack());
          },
          onUrlChange: (_) => unawaited(refreshCanGoBack()),
          onNavigationRequest: handleNavigationRequest,
          onWebResourceError: (error) {
            if (error.isForMainFrame == false || !mounted) return;
            setState(() {
              _isLoading = false;
              _hasError = true;
            });
          },
        ),
      );
      if (mounted) await loadInitialPage();
    } catch (error) {
      debugPrint('WebView initialization failed: $error');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Future<void> loadInitialPage() async {
    final uri = Uri.tryParse(widget.param.url);
    if (uri == null || !isTrustedWebUri(uri)) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      return;
    }

    if (mounted) {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });
    }

    try {
      final postParameters = widget.param.postParameters;
      if (postParameters != null) {
        await _controller.loadHtmlString(_buildPostForm(postParameters));
      } else {
        await _controller.loadRequest(uri);
      }
    } catch (error) {
      debugPrint('WebView failed to load: $error');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  bool isTrustedWebUri(Uri uri) {
    final initialUri = Uri.tryParse(widget.param.url);
    if (initialUri == null ||
        uri.scheme.toLowerCase() != 'https' ||
        uri.userInfo.isNotEmpty) {
      return false;
    }

    final host = uri.host.toLowerCase();
    if (host == initialUri.host.toLowerCase()) {
      return uri.port == initialUri.port;
    }

    final allowedHosts = widget.param.allowedHosts
        .map((allowedHost) => allowedHost.toLowerCase())
        .toSet();
    return uri.port == 443 && allowedHosts.contains(host);
  }

  bool _matchesUrl(String url, String? expectedUrl) {
    if (expectedUrl == null || expectedUrl.isEmpty) return false;
    final actualUri = Uri.tryParse(url);
    final expectedUri = Uri.tryParse(expectedUrl);
    if (actualUri == null || expectedUri == null) return false;

    return actualUri.scheme.toLowerCase() == expectedUri.scheme.toLowerCase() &&
        actualUri.host.toLowerCase() == expectedUri.host.toLowerCase() &&
        actualUri.port == expectedUri.port &&
        actualUri.path == expectedUri.path;
  }

  Future<NavigationDecision> handleNavigationRequest(
    NavigationRequest request,
  ) async {
    if (_matchesUrl(request.url, widget.param.successUrl)) {
      if (mounted) await Navigator.of(context).maybePop(true);
      return NavigationDecision.prevent;
    }
    if (_matchesUrl(request.url, widget.param.failureUrl)) {
      if (mounted) await Navigator.of(context).maybePop(false);
      return NavigationDecision.prevent;
    }

    final uri = Uri.tryParse(request.url);
    if (uri == null) return NavigationDecision.prevent;
    if (isTrustedWebUri(uri)) return NavigationDecision.navigate;
    if (!request.isMainFrame) return NavigationDecision.prevent;

    final scheme = uri.scheme.toLowerCase();
    final canOpenExternally =
        scheme == 'https' ||
        scheme == 'http' ||
        scheme == 'mailto' ||
        scheme == 'tel';
    if (canOpenExternally) {
      try {
        await launchUrl(
          uri,
          mode: scheme == 'http' || scheme == 'https'
              ? LaunchMode.externalApplication
              : LaunchMode.platformDefault,
        );
      } catch (error) {
        debugPrint('Could not open external WebView link: $error');
      }
    }
    return NavigationDecision.prevent;
  }

  Future<void> refreshCanGoBack() async {
    if (!mounted) return;
    final canGoBack = await _controller.canGoBack();
    if (!mounted || canGoBack == _canGoBack) return;
    setState(() => _canGoBack = canGoBack);
  }

  Future<void> handleSystemBack(bool didPop) async {
    if (didPop || !_canGoBack) return;
    await _controller.goBack();
    await refreshCanGoBack();
  }

  String _buildPostForm(Map<String, String> parameters) {
    final fields = parameters.entries
        .map(
          (entry) =>
              '<input type="hidden" name="${_escapeHtml(entry.key)}" '
              'value="${_escapeHtml(entry.value)}">',
        )
        .join();
    return '''
<!doctype html><html><body onload="document.forms[0].submit()">
      <form method="POST" action="${_escapeHtml(widget.param.url)}">$fields</form>
    </body></html>''';
  }

  String _escapeHtml(String value) => value
      .replaceAll('&', '&amp;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#39;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;');

  @override
  Widget build(BuildContext context) {
    final webView = PopScope<Object?>(
      canPop: !_canGoBack,
      onPopInvokedWithResult: (didPop, _) {
        unawaited(handleSystemBack(didPop));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: AppLoadingWidget.small()),
          if (_hasError)
            ColoredBox(
              color: AppColors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.wifi_off_rounded,
                      color: AppColors.neutralMediumGray,
                      size: 40,
                    ),
                    const VerticalSpacing(12),
                    Text(
                      'Unable to load this page',
                      style: AppTextStyles.textMediumRegular.copyWith(
                        color: AppColors.neutralMediumGray,
                      ),
                    ),
                    const VerticalSpacing(12),
                    AppFilledButton(
                      text: 'Retry',
                      onPressed: loadInitialPage,
                      borderRadius: 12,
                      height: 44,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );

    return widget.param.wrapInScaffold ? AppScaffold(body: webView) : webView;
  }
}
