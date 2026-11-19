import 'package:flutter/material.dart';
import 'package:tukaatuexpress/core/dio_provider/api_response.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';

class AppSliverGrid extends StatefulWidget {
  const AppSliverGrid({
    required this.itemBuilder, required this.itemCount, required this.gridDelegate, super.key,
    this.padding = EdgeInsets.zero,
    this.isLoadingMore = false,
    this.onLoadMore,
    this.paginationInfo,
    this.progressIndicator = const AppLoadingWidget.small(),
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final SliverGridDelegate gridDelegate;
  final EdgeInsetsGeometry padding;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final PaginationInfo? paginationInfo;
  final Widget progressIndicator;

  @override
  State<AppSliverGrid> createState() => _AppSliverGridState();
}

class _AppSliverGridState extends State<AppSliverGrid> {
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
    if (widget.onLoadMore == null ||
        widget.isLoadingMore ||
        !_effectiveController.hasClients ||
        !_canLoadMore(widget.paginationInfo)) {
      return;
    }

    try {
      final position = _effectiveController.position;
      final isNearBottom = position.extentAfter < 500;
      final isContentNotFillingScreen = position.maxScrollExtent == 0;

      if (isNearBottom || isContentNotFillingScreen) {
        widget.onLoadMore!();
      }
    } catch (_) {}
  }

  bool _canLoadMore(PaginationInfo? paginationInfo) {
    if (paginationInfo == null) return true;
    return paginationInfo.hasMore == true;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: widget.padding,
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index < widget.itemCount) {
            return widget.itemBuilder(context, index);
          }

          return Center(child: widget.progressIndicator);
        }, childCount: widget.itemCount + (widget.isLoadingMore ? 1 : 0)),
        gridDelegate: widget.gridDelegate,
      ),
    );
  }
}
