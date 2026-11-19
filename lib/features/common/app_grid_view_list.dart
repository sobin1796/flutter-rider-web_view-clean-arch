import 'package:flutter/material.dart';
import 'package:tukaatuexpress/core/dio_provider/api_response.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';

class AppGridViewList extends StatefulWidget {
  const AppGridViewList({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
    this.separatorBuilder,
    this.gridDelegate,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.padding = EdgeInsets.zero,
    this.isLoadingMore = false,
    this.onLoadMore,
    this.shrinkWrap = false,
    this.loadingIndicator,
    this.physics,
    this.paginationInfo,
    this.feedPaginationInfo,
    this.progressIndicatorBuilder = const AppLoadingWidget.small(),
  });
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final int itemCount;
  final SliverGridDelegate? gridDelegate;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final PaginationInfo? paginationInfo;
  final FeedPaginationInfo? feedPaginationInfo;
  final Widget? loadingIndicator;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Widget progressIndicatorBuilder;

  @override
  State<AppGridViewList> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppGridViewList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndLoadMore(); // Check if content fits right after build
    });

    _scrollController.addListener(_checkAndLoadMore); // Scroll-based check
  }

  void _checkAndLoadMore() {
    if (widget.onLoadMore != null &&
        !widget.isLoadingMore &&
        _canLoadMore(widget.paginationInfo, widget.feedPaginationInfo)) {
      final isNearBottom = _scrollController.position.extentAfter < 500;
      final isContentNotFillingScreen =
          _scrollController.position.maxScrollExtent == 0;

      if (isNearBottom || isContentNotFillingScreen) {
        widget.onLoadMore!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: widget.padding,
      physics: widget.physics,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      controller: _scrollController,
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.itemCount + (widget.isLoadingMore ? 1 : 0),
      gridDelegate:
          widget.gridDelegate ??
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 95,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
      itemBuilder: (context, index) {
        if (index < widget.itemCount) {
          return widget.itemBuilder(context, index);
        } else {
          return widget.progressIndicatorBuilder;
        }
      },
    );
  }

  bool _canLoadMore(
    PaginationInfo? paginationInfo,
    FeedPaginationInfo? feedPaginationInfo,
  ) {
    if (feedPaginationInfo != null) {
      return feedPaginationInfo.hasMore == true &&
          feedPaginationInfo.nextCursor != null;
    }
    if (paginationInfo == null) return true;
    return (paginationInfo.currentPage ?? 1) < (paginationInfo.lastPage ?? 1);
  }
}
