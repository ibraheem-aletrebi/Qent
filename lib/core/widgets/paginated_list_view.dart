import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/app_text_styles.dart';
import 'package:quent/core/widgets/loading_widget.dart';

typedef ItemBuilder<T> = Widget Function(T item);
typedef SkeletonBuilder = Widget Function();
typedef ErrorBuilder = Widget Function(String? message, VoidCallback? onRetry);
typedef EmptyBuilder = Widget Function(String message, VoidCallback? onRefresh);

enum PaginatedLayout { list, grid }

enum PaginatedScrollDirection { vertical, horizontal }

class PaginatedListView<T> extends StatefulWidget {
  final List<T> items;
  final bool isLoadingMore;
  final bool hasError;
  final bool hasReachedMax;
  final String? errorMessage;
  final VoidCallback? onLoadMore;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onRetry;
  final ItemBuilder<T> itemBuilder;
  final SkeletonBuilder? skeletonBuilder;
  final Widget? emptyWidget;
  final ErrorBuilder? errorBuilder;
  final EmptyBuilder? emptyBuilder;
  final Widget? separatorWidget;
  final PaginatedLayout layout;
  final PaginatedScrollDirection scrollDirection;
  final int gridCrossAxisCount;
  final double gridChildAspectRatio;
  final double gridCrossAxisSpacing;
  final double gridMainAxisSpacing;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final double scrollThreshold;
  final int skeletonCount;
  final String emptyMessage;
  final bool shrinkWrap;
  final bool showNoMoreData;
  final bool primary;

  const PaginatedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.isLoadingMore = false,
    this.hasError = false,
    this.hasReachedMax = false,
    this.errorMessage,
    this.onLoadMore,
    this.onRefresh,
    this.onRetry,
    this.skeletonBuilder,
    this.emptyWidget,
    this.errorBuilder,
    this.emptyBuilder,
    this.separatorWidget,
    this.layout = PaginatedLayout.list,
    this.scrollDirection = PaginatedScrollDirection.vertical,
    this.gridCrossAxisCount = 2,
    this.gridChildAspectRatio = 1.0,
    this.gridCrossAxisSpacing = 12,
    this.gridMainAxisSpacing = 12,
    this.scrollController,
    this.physics,
    this.padding,
    this.scrollThreshold = 200,
    this.skeletonCount = 6,
    this.emptyMessage = 'No items found',
    this.shrinkWrap = false,
    this.showNoMoreData = true,
    this.primary = false,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  late final ScrollController _scrollController;
  late final _PaginationController _paginationController;

  bool get _isHorizontal =>
      widget.scrollDirection == PaginatedScrollDirection.horizontal;
  bool get _hasExternalController => widget.scrollController != null;
  bool get _shouldShowRefresh => widget.onRefresh != null && !_isHorizontal;
  Axis get _axis => _isHorizontal ? Axis.horizontal : Axis.vertical;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _paginationController = _PaginationController(
      onLoadMore: widget.onLoadMore,
      scrollThreshold: widget.scrollThreshold,
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(PaginatedListView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.onLoadMore != widget.onLoadMore ||
        oldWidget.scrollThreshold != widget.scrollThreshold) {
      _paginationController.update(
        onLoadMore: widget.onLoadMore,
        scrollThreshold: widget.scrollThreshold,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    if (!_hasExternalController) _scrollController.dispose();
    _paginationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    _paginationController.checkAndLoadMore(
      scrollController: _scrollController,
      isLoadingMore: widget.isLoadingMore,
      hasReachedMax: widget.hasReachedMax,
      hasError: widget.hasError,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hasError && widget.items.isEmpty) return _buildError(context);
    if (widget.items.isEmpty) return _buildEmpty(context);

    final content = widget.layout == PaginatedLayout.grid
        ? _buildGrid(context)
        : _buildList(context);

    if (_shouldShowRefresh) {
      return RefreshIndicator(
        onRefresh: widget.onRefresh!,
        color: context.myColors.primary,
        child: content,
      );
    }
    return content;
  }

  Widget _buildList(BuildContext context) {
    final padding = widget.padding ?? _getDefaultPadding();

    if (widget.separatorWidget != null) {
      return ListView.separated(
        controller: _scrollController,
        scrollDirection: _axis,
        physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
        padding: padding,
        shrinkWrap: widget.shrinkWrap,
        primary: widget.primary,
        itemCount: widget.items.length,
        separatorBuilder: (_, _) => widget.separatorWidget!,
        itemBuilder: (ctx, i) {
          final item = widget.itemBuilder(widget.items[i]);
          if (i == widget.items.length - 1 && _showFooter) {
            return _isHorizontal
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [item, _buildFooter(ctx)],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [item, _buildFooter(ctx)],
                  );
          }
          return item;
        },
      );
    }

    return ListView.builder(
      controller: _scrollController,
      scrollDirection: _axis,
      physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
      padding: padding,
      shrinkWrap: widget.shrinkWrap,
      primary: widget.primary,
      itemCount: widget.items.length + (_showFooter ? 1 : 0),
      itemBuilder: (ctx, i) {
        if (i < widget.items.length) return widget.itemBuilder(widget.items[i]);
        return _buildFooter(ctx);
      },
    );
  }

  Widget _buildGrid(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
      primary: widget.primary,
      slivers: [
        SliverPadding(
          padding: widget.padding ?? EdgeInsets.all(AppSizes.w16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, i) => widget.itemBuilder(widget.items[i]),
              childCount: widget.items.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.gridCrossAxisCount,
              childAspectRatio: widget.gridChildAspectRatio,
              crossAxisSpacing: widget.gridCrossAxisSpacing,
              mainAxisSpacing: widget.gridMainAxisSpacing,
            ),
          ),
        ),
        if (_showFooter) SliverToBoxAdapter(child: _buildFooter(context)),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final colors = context.myColors;
    if (widget.isLoadingMore) {
      return Padding(
        padding: EdgeInsets.all(AppSizes.w12),
        child: LoadingWidget(size: AppSizes.w24),
      );
    }
    if (widget.hasError && widget.items.isNotEmpty) {
      return _RetryButton(
        onRetry: widget.onRetry ?? widget.onLoadMore,
        color: colors.primary,
        isHorizontal: _isHorizontal,
      );
    }
    if (widget.hasReachedMax && widget.showNoMoreData) {
      return _NoMoreDataIndicator(
        isHorizontal: _isHorizontal,
        color: colors.divider,
        textColor: colors.textHint,
      );
    }
    return _EmptySpace(isHorizontal: _isHorizontal);
  }

  Widget _buildEmpty(BuildContext context) {
    if (widget.emptyWidget != null) return widget.emptyWidget!;
    if (widget.emptyBuilder != null) {
      return widget.emptyBuilder!(
        widget.emptyMessage,
        _shouldShowRefresh ? widget.onRefresh! : null,
      );
    }
    return _DefaultEmptyView(
      message: widget.emptyMessage,
      onRefresh: _shouldShowRefresh ? widget.onRefresh : null,
    );
  }

  Widget _buildError(BuildContext context) {
    if (widget.errorBuilder != null) {
      return widget.errorBuilder!(
        widget.errorMessage,
        widget.onRetry ?? widget.onRefresh,
      );
    }
    return _DefaultErrorView(
      message: widget.errorMessage ?? 'Something went wrong',
      onRetry: widget.onRetry ?? widget.onRefresh,
    );
  }

  EdgeInsets _getDefaultPadding() => _isHorizontal
      ? EdgeInsets.symmetric(horizontal: AppSizes.w16, vertical: AppSizes.h8)
      : EdgeInsets.all(AppSizes.w16);

  bool get _showFooter =>
      widget.isLoadingMore ||
      (widget.hasError && widget.items.isNotEmpty) ||
      (widget.hasReachedMax && widget.showNoMoreData);
}

class _PaginationController {
  VoidCallback? _onLoadMore;
  double _scrollThreshold;

  _PaginationController({
    required VoidCallback? onLoadMore,
    required double scrollThreshold,
  }) : _onLoadMore = onLoadMore,
       _scrollThreshold = scrollThreshold;

  void update({
    required VoidCallback? onLoadMore,
    required double scrollThreshold,
  }) {
    _onLoadMore = onLoadMore;
    _scrollThreshold = scrollThreshold;
  }

  void checkAndLoadMore({
    required ScrollController scrollController,
    required bool isLoadingMore,
    required bool hasReachedMax,
    required bool hasError,
  }) {
    if (!scrollController.hasClients) return;
    if (_onLoadMore == null || isLoadingMore || hasReachedMax || hasError) {
      return;
    }
    final max = scrollController.position.maxScrollExtent;
    final cur = scrollController.position.pixels;
    if (cur >= max - _scrollThreshold) _onLoadMore!();
  }

  void dispose() => _onLoadMore = null;
}

class _RetryButton extends StatelessWidget {
  final VoidCallback? onRetry;
  final Color color;
  final bool isHorizontal;
  const _RetryButton({
    required this.onRetry,
    required this.color,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: IconButton(
      onPressed: onRetry,
      icon: Icon(Icons.refresh_rounded, color: color),
    ),
  );
}

class _NoMoreDataIndicator extends StatelessWidget {
  final bool isHorizontal;
  final Color color;
  final Color textColor;
  const _NoMoreDataIndicator({
    required this.isHorizontal,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w8),
        child: Center(
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.h20),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: color,
              indent: AppSizes.w24,
              endIndent: AppSizes.w12,
            ),
          ),
          Text(
            'No more items',
            style: AppTextStyles.regular12.copyWith(color: textColor),
          ),
          Expanded(
            child: Divider(
              color: color,
              indent: AppSizes.w12,
              endIndent: AppSizes.w24,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptySpace extends StatelessWidget {
  final bool isHorizontal;
  const _EmptySpace({required this.isHorizontal});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: isHorizontal ? AppSizes.w8 : null,
    height: isHorizontal ? null : AppSizes.h16,
  );
}

class _DefaultEmptyView extends StatelessWidget {
  final String message;
  final Future<void> Function()? onRefresh;
  const _DefaultEmptyView({required this.message, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox_outlined, size: 56, color: colors.textHint),
          SizedBox(height: AppSizes.h12),
          Text(
            message,
            style: AppTextStyles.regular14.copyWith(color: colors.textHint),
            textAlign: TextAlign.center,
          ),
          if (onRefresh != null) ...[
            SizedBox(height: AppSizes.h16),
            TextButton(
              onPressed: onRefresh,
              child: Text(
                'Refresh',
                style: AppTextStyles.semiBold14.copyWith(color: colors.primary),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DefaultErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  const _DefaultErrorView({required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colors = context.myColors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off_rounded, size: 56, color: colors.textHint),
          SizedBox(height: AppSizes.h12),
          Text(
            message,
            style: AppTextStyles.regular14.copyWith(color: colors.textHint),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.h16),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
