import 'dart:async';

import 'package:flutter/material.dart';

/// Callback for loading more items when scrolling
typedef LoadMoreCallback<T> = Future<List<T>> Function(int page);

/// Callback for searching items
typedef SearchCallback<T> = Future<List<T>> Function(String query, int page);

/// Callback for item selection
typedef ItemSelectedCallback<T> = void Function(T item);

/// Builder for custom item rendering
typedef ItemBuilder<T> =
    Widget Function(BuildContext context, T item, int index, bool isSelected);

class CustomPopupMenu<T> extends StatefulWidget {
  final List<T> initialItems;
  final bool enableSearch;
  final String searchHint;
  final bool enablePagination;
  final int itemsPerPage;
  final LoadMoreCallback<T>? onLoadMore;
  final SearchCallback<T>? onSearch;
  final ItemBuilder<T> itemBuilder;
  final ItemSelectedCallback<T> onItemSelected;
  final double? height;
  final double? width;
  final double maxHeight;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool showDividers;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final Widget Function(String error)? errorBuilder;
  final Duration searchDebounce;
  final double elevation;
  final EdgeInsetsGeometry? contentPadding;
  final double? itemHeight;
  final bool closeOnSelection;
  final Widget? title;
  final List<Widget>? actions;
  final T? selectedItem;
  final bool Function(T a, T b)? itemComparator;

  const CustomPopupMenu({
    super.key,
    required this.initialItems,
    required this.itemBuilder,
    required this.onItemSelected,
    this.enableSearch = true,
    this.searchHint = 'Search...',
    this.enablePagination = false,
    this.itemsPerPage = 20,
    this.onLoadMore,
    this.onSearch,
    this.height,
    this.width,
    this.maxHeight = 400,
    this.borderRadius,
    this.backgroundColor,
    this.showDividers = true,
    this.emptyWidget,
    this.loadingWidget,
    this.errorBuilder,
    this.searchDebounce = const Duration(milliseconds: 300),
    this.elevation = 8,
    this.contentPadding,
    this.itemHeight,
    this.closeOnSelection = true,
    this.title,
    this.actions,
    this.selectedItem,
    this.itemComparator,
  });

  @override
  State<CustomPopupMenu<T>> createState() => _CustomPopupMenuState<T>();

  /// Helper method to show the popup menu
  static Future<T?> show<T>({
    required BuildContext context,
    required List<T> items,
    required ItemBuilder<T> itemBuilder,
    bool enableSearch = true,
    String searchHint = 'Search...',
    bool enablePagination = false,
    int itemsPerPage = 20,
    LoadMoreCallback<T>? onLoadMore,
    SearchCallback<T>? onSearch,
    double? height,
    double? width,
    double maxHeight = 400,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    bool showDividers = true,
    Widget? emptyWidget,
    Widget? loadingWidget,
    Widget Function(String error)? errorBuilder,
    Duration searchDebounce = const Duration(milliseconds: 300),
    double elevation = 8,
    EdgeInsetsGeometry? contentPadding,
    double? itemHeight,
    Widget? title,
    List<Widget>? actions,
    T? selectedItem,
    bool Function(T a, T b)? itemComparator,
    Offset? position,
    AlignmentGeometry alignment = Alignment.topLeft,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black26,
      builder: (context) => _PopupMenuDialog<T>(
        items: items,
        itemBuilder: itemBuilder,
        enableSearch: enableSearch,
        searchHint: searchHint,
        enablePagination: enablePagination,
        itemsPerPage: itemsPerPage,
        onLoadMore: onLoadMore,
        onSearch: onSearch,
        height: height,
        width: width,
        maxHeight: maxHeight,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        showDividers: showDividers,
        emptyWidget: emptyWidget,
        loadingWidget: loadingWidget,
        errorBuilder: errorBuilder,
        searchDebounce: searchDebounce,
        elevation: elevation,
        contentPadding: contentPadding,
        itemHeight: itemHeight,
        title: title,
        actions: actions,
        selectedItem: selectedItem,
        itemComparator: itemComparator,
        position: position,
        alignment: alignment,
      ),
    );
  }
}

class _CustomPopupMenuState<T> extends State<CustomPopupMenu<T>> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  List<T> _displayedItems = [];
  List<T> _filteredItems = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String? _errorMessage;
  Timer? _debounceTimer;
  String _currentSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _displayedItems = List.from(widget.initialItems);
    _filteredItems = List.from(widget.initialItems);

    if (widget.enablePagination) {
      _applyPagination();
    }

    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  void _applyPagination() {
    final endIndex = (_currentPage * widget.itemsPerPage).clamp(
      0,
      _filteredItems.length,
    );
    _displayedItems = _filteredItems.sublist(0, endIndex);
    _hasMore = endIndex < _filteredItems.length;
  }

  void _onScroll() {
    if (!widget.enablePagination) return;
    if (_isLoadingMore || !_hasMore) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final delta = maxScroll - currentScroll;

    if (delta < 200) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() => _isLoadingMore = true);

    try {
      if (widget.onLoadMore != null && _currentSearchQuery.isEmpty) {
        // Load more from server
        final newItems = await widget.onLoadMore!(_currentPage + 1);
        if (mounted) {
          setState(() {
            _filteredItems.addAll(newItems);
            _currentPage++;
            _applyPagination();
            _isLoadingMore = false;
          });
        }
      } else {
        // Load more from local pagination
        _currentPage++;
        _applyPagination();
        setState(() => _isLoadingMore = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoadingMore = false;
        });
      }
    }
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.searchDebounce, () {
      _performSearch(_searchController.text);
    });
  }

  Future<void> _performSearch(String query) async {
    if (!mounted) return;

    _currentSearchQuery = query;

    if (query.isEmpty) {
      setState(() {
        _filteredItems = List.from(widget.initialItems);
        _currentPage = 1;
        _hasMore = true;
        _errorMessage = null;
        if (widget.enablePagination) {
          _applyPagination();
        } else {
          _displayedItems = _filteredItems;
        }
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      List<T> searchResults;

      if (widget.onSearch != null) {
        // Search using custom callback
        searchResults = await widget.onSearch!(query, 1);
      } else {
        // Default search (convert items to string and filter)
        searchResults = widget.initialItems.where((item) {
          return item.toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      }

      if (mounted) {
        setState(() {
          _filteredItems = searchResults;
          _currentPage = 1;
          _hasMore = widget.enablePagination;
          if (widget.enablePagination) {
            _applyPagination();
          } else {
            _displayedItems = _filteredItems;
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _onItemTap(T item) {
    widget.onItemSelected(item);
    if (widget.closeOnSelection) {
      Navigator.of(context).pop(item);
    }
  }

  bool _isItemSelected(T item) {
    if (widget.selectedItem == null) return false;
    if (widget.itemComparator != null) {
      return widget.itemComparator!(item, widget.selectedItem!);
    }
    return item == widget.selectedItem;
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: widget.elevation,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
      color: widget.backgroundColor ?? theme.cardColor,
      child: Container(
        height: widget.height,
        width: widget.width ?? 300,
        constraints: BoxConstraints(maxHeight: widget.maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title bar
            if (widget.title != null || widget.actions != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: theme.dividerColor, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    if (widget.title != null) Expanded(child: widget.title!),
                    if (widget.actions != null) ...widget.actions!,
                  ],
                ),
              ),

            // Search bar
            if (widget.enableSearch)
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  decoration: InputDecoration(
                    hintText: widget.searchHint,
                    prefixIcon: const Icon(Icons.search, size: 20),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 20),
                            onPressed: () {
                              _searchController.clear();
                              _searchFocusNode.requestFocus();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    isDense: true,
                  ),
                ),
              ),

            // Content
            Flexible(child: _buildContent(theme)),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    if (_isLoading) {
      return Center(
        child: widget.loadingWidget ?? const CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child:
            widget.errorBuilder?.call(_errorMessage!) ??
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Error: $_errorMessage',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _performSearch(_currentSearchQuery),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
      );
    }

    if (_displayedItems.isEmpty) {
      return Center(
        child:
            widget.emptyWidget ??
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.inbox_outlined, size: 48, color: theme.hintColor),
                  const SizedBox(height: 8),
                  Text(
                    _currentSearchQuery.isEmpty
                        ? 'No items available'
                        : 'No results found',
                    style: TextStyle(color: theme.hintColor),
                  ),
                ],
              ),
            ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 8),
      itemCount: _displayedItems.length + (_isLoadingMore ? 1 : 0),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == _displayedItems.length) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: widget.loadingWidget ?? const CircularProgressIndicator(),
            ),
          );
        }

        final item = _displayedItems[index];
        final isSelected = _isItemSelected(item);

        return InkWell(
          onTap: () => _onItemTap(item),
          child: Container(
            height: widget.itemHeight,
            color: isSelected ? theme.primaryColor.withOpacity(0.1) : null,
            child: widget.itemBuilder(context, item, index, isSelected),
          ),
        );
      },
      separatorBuilder: widget.showDividers
          ? (context, index) => Divider(height: 1, thickness: 1)
          : (context, index) => const SizedBox.shrink(),
    );
  }
}

/// Dialog wrapper for popup menu
class _PopupMenuDialog<T> extends StatelessWidget {
  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final bool enableSearch;
  final String searchHint;
  final bool enablePagination;
  final int itemsPerPage;
  final LoadMoreCallback<T>? onLoadMore;
  final SearchCallback<T>? onSearch;
  final double? height;
  final double? width;
  final double maxHeight;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool showDividers;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final Widget Function(String error)? errorBuilder;
  final Duration searchDebounce;
  final double elevation;
  final EdgeInsetsGeometry? contentPadding;
  final double? itemHeight;
  final Widget? title;
  final List<Widget>? actions;
  final T? selectedItem;
  final bool Function(T a, T b)? itemComparator;
  final Offset? position;
  final AlignmentGeometry alignment;

  const _PopupMenuDialog({
    required this.items,
    required this.itemBuilder,
    required this.enableSearch,
    required this.searchHint,
    required this.enablePagination,
    required this.itemsPerPage,
    this.onLoadMore,
    this.onSearch,
    this.height,
    this.width,
    required this.maxHeight,
    this.borderRadius,
    this.backgroundColor,
    required this.showDividers,
    this.emptyWidget,
    this.loadingWidget,
    this.errorBuilder,
    required this.searchDebounce,
    required this.elevation,
    this.contentPadding,
    this.itemHeight,
    this.title,
    this.actions,
    this.selectedItem,
    this.itemComparator,
    this.position,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomPopupMenu<T>(
          initialItems: items,
          itemBuilder: itemBuilder,
          onItemSelected: (item) {
            Navigator.of(context).pop(item);
          },
          enableSearch: enableSearch,
          searchHint: searchHint,
          enablePagination: enablePagination,
          itemsPerPage: itemsPerPage,
          onLoadMore: onLoadMore,
          onSearch: onSearch,
          height: height,
          width: width,
          maxHeight: maxHeight,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor,
          showDividers: showDividers,
          emptyWidget: emptyWidget,
          loadingWidget: loadingWidget,
          errorBuilder: errorBuilder,
          searchDebounce: searchDebounce,
          elevation: elevation,
          contentPadding: contentPadding,
          itemHeight: itemHeight,
          title: title,
          actions: actions,
          selectedItem: selectedItem,
          itemComparator: itemComparator,
        ),
      ),
    );
  }
}
