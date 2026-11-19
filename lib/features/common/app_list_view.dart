import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/common/app_divider.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';

class AppListView extends StatefulWidget {
  const AppListView({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
    this.separatorBuilder,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.padding = EdgeInsets.zero,
    this.isLoadingMore = false,
    this.onLoadMore,
    this.shrinkWrap = false,
    this.loadingIndicator,
    this.physics,
    this.canLoadMore = true,
    this.progressIndicatorBuilder = const AppLoadingWidget.small(),
  });
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final int itemCount;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final bool canLoadMore;
  final Widget? loadingIndicator;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Widget progressIndicatorBuilder;

  @override
  State<AppListView> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  ScrollController? _ownedController;

  ScrollController get _effectiveController {
    final primary = PrimaryScrollController.maybeOf(context);
    if (primary != null) return primary;
    return _ownedController ??= ScrollController();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _effectiveController.addListener(_checkAndLoadMore);
      _checkAndLoadMore();
    });
  }

  @override
  void dispose() {
    _ownedController?.dispose();
    super.dispose();
  }

  void _checkAndLoadMore() {
    if (!mounted ||
        widget.onLoadMore == null ||
        widget.isLoadingMore ||
        !_effectiveController.hasClients ||
        !widget.canLoadMore) {
      return;
    }
    try {
      final position = _effectiveController.position;
      final isNearBottom = position.extentAfter < 1000;
      final isContentNotFillingScreen = position.maxScrollExtent == 0;
      if (isNearBottom || isContentNotFillingScreen) {
        widget.onLoadMore!();
      }
    } catch (_) {
      // position not ready yet
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = PrimaryScrollController.maybeOf(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isUnbounded = constraints.maxHeight == double.infinity;
        return ListView.separated(
          controller: primary != null
              ? null
              : (_ownedController ??= ScrollController()),
          primary: primary != null,
          keyboardDismissBehavior: widget.keyboardDismissBehavior,
          padding: widget.padding,
          physics: isUnbounded
              ? const NeverScrollableScrollPhysics()
              : widget.physics,
          shrinkWrap: isUnbounded || widget.shrinkWrap,
          itemBuilder: (context, index) {
            if (index < widget.itemCount) {
              return widget.itemBuilder(context, index);
            } else {
              return widget.progressIndicatorBuilder;
            }
          },
          separatorBuilder:
              widget.separatorBuilder ??
              (context, index) => const AppDivider(color: Colors.transparent),
          itemCount: widget.itemCount + (widget.isLoadingMore ? 1 : 0),
        );
      },
    );
  }
}
