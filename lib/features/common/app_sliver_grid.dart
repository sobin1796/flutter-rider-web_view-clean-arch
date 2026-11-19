import 'package:flutter/material.dart';
import 'package:tukaatuexpress/core/dio_provider/api_response.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';

class AppSliverGrid extends StatefulWidget {
  const AppSliverGrid({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
    this.gridDelegate,
    this.padding = EdgeInsets.zero,
    this.isLoadingMore = false,
    this.onLoadMore,
    this.paginationInfo,
    this.progressIndicatorBuilder = const AppLoadingWidget.small(),
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final SliverGridDelegate? gridDelegate;
  final EdgeInsetsGeometry padding;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final PaginationInfo? paginationInfo;
  final Widget progressIndicatorBuilder;

  @override
  State<AppSliverGrid> createState() => _AppSliverGridState();
}

class _AppSliverGridState extends State<AppSliverGrid> {
  bool _canLoadMore(PaginationInfo? info) {
    if (info == null) return true;
    return (info.currentPage ?? 1) < (info.lastPage ?? 1);
  }

  void _tryLoadMore() {
    if (widget.onLoadMore != null &&
        !widget.isLoadingMore &&
        _canLoadMore(widget.paginationInfo)) {
      widget.onLoadMore!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: widget.padding,
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == widget.itemCount - 1) {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => _tryLoadMore());
                }
                return widget.itemBuilder(context, index);
              },
              childCount: widget.itemCount,
            ),
            gridDelegate: widget.gridDelegate ??
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
          ),
        ),
        if (widget.isLoadingMore)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(child: widget.progressIndicatorBuilder),
            ),
          ),
      ],
    );
  }
}
