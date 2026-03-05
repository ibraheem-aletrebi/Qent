import 'package:equatable/equatable.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

class PaginatedDropdownState<T> extends Equatable {
  final List<T> items;
  final T? selectedItem;
  final bool isLoading;
  final bool hasMore;
  final String searchQuery;
  final ErrorModel? error;
  final int currentPage;

  const PaginatedDropdownState({
    this.items = const [],
    this.selectedItem,
    this.isLoading = false,
    this.hasMore = true,
    this.searchQuery = '',
    this.error,
    this.currentPage = 1,
  });

  PaginatedDropdownState<T> copyWith({
    List<T>? items,
    bool? isLoading,
    bool? hasMore,
    String? searchQuery,
    T? selectedItem,
    ErrorModel? error,
  }) {
    return PaginatedDropdownState<T>(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedItem: selectedItem ?? this.selectedItem,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    items,
    selectedItem,
    isLoading,
    hasMore,
    searchQuery,
    error,
    currentPage,
  ];
}
