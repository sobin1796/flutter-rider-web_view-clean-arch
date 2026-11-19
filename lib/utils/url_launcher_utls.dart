import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_web_view.dart';
import 'package:tukaatuexpress/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncherUtils {
  // static Future<void> openUrl(BuildContext context, String? url) async {
  //   if (url == null) {
  //     AppUtils.showErrorSnackbar(message: 'No url');
  //     return;
  //   }
  //   if (await canLaunchUrlString(url)) {
  //     await launchUrlString(url);
  //   } else {
  //     if (context.mounted) {
  //       AppUtils.showErrorSnackbar(message: 'Currently No hosted Url ');
  //     }
  //   }
  // }

  static Future<void> openWebIfPossible(String? url) async {
    if (url == null) {
      return;
    }
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  static Future<void> launchMail(String mail) async {
    final uri = Uri(scheme: 'mailto', path: mail);
    await launchUrl(uri);
  }

  static Future<void> launchContact(String contact) async {
    final numbers = contact.split(',');
    if (numbers.isNotEmpty) {
      final number = numbers[0];
      final uri = Uri(scheme: 'tel', path: number);
      await launchUrl(uri);
    }
  }

  static Future<void> launchSMS(String contact) async {
    final numbers = contact.split(',');
    if (numbers.isNotEmpty) {
      final number = numbers[0];
      final uri = Uri(scheme: 'sms', path: number);
      await launchUrl(uri);
    }
  }

  static Future<void> openUrlOrWebView(
    BuildContext context,
    String? url,
  ) async {
    if (url == null || url.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'No url');
      return;
    }

    final uri = Uri.tryParse(url);

    if (uri == null) {
      AppUtils.showErrorSnackbar(message: 'Invalid url');
      return;
    }

    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);

      if (opened || !context.mounted) {
        return;
      }
    } catch (_) {
      // Fall through to WebView.
    }

    if (!context.mounted) return;

    context.push(
      AppRoutes.appWebView,
      extra: AppWebViewParam(url: url, title: 'Social links'),
    );
  }

  static void openInAppWebView(
    BuildContext context,
    String? url, {
    String? title,
  }) {
    if (url == null || url.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'No url');
      return;
    }

    final uri = Uri.tryParse(url);
    if (uri == null ||
        !{'http', 'https'}.contains(uri.scheme.toLowerCase()) ||
        uri.host.isEmpty) {
      AppUtils.showErrorSnackbar(message: 'Invalid url');
      return;
    }

    context.push(
      AppRoutes.appWebView,
      extra: AppWebViewParam(url: url, title: title ?? uri.host),
    );
  }
}
