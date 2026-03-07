import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:quent/core/services/remote/api_result.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/models/paginated_response.dart';
import 'paginated_dropdown_state.dart';

class PaginatedDropdownCubit<T> extends Cubit<PaginatedDropdownState<T>> {
  PaginatedDropdownCubit({
    required this.fetchData,
    this.searchDelay = const Duration(seconds: 2),
  }) : super(PaginatedDropdownState<T>());

  final Future<ApiResult<PaginatedResponse<T>>> Function(
    int page,
    String searchQuery,
  )
  fetchData;
  final Duration searchDelay;

  int _currentPage = 1;
  Timer? _searchTimer;

  Future<void> init() => loadData(reset: true);

  Future<void> loadData({bool reset = false}) async {
    if (state.isLoading) return;

    if (reset) _currentPage = 1;

    emit(
      state.copyWith(
        isLoading: true,
        error: reset ? null : state.error,
        selectedItem: state.selectedItem,
      ),
    );

    final response = await fetchData(_currentPage, state.searchQuery);

    response.when(
      onSuccess: (result) {
        final items = reset ? result.data : [...state.items, ...result.data];

        emit(
          state.copyWith(
            items: items,
            hasMore: result.hasMore,
            isLoading: false,
            selectedItem: state.selectedItem,
          ),
        );
      },
      onError: (error) {
        emit(
          state.copyWith(
            isLoading: false,
            error: error,
            selectedItem: state.selectedItem,
          ),
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.hasMore && !state.isLoading) {
      _currentPage++;
      await loadData();
    }
  }

  void onSearchChanged(String query) {
    emit(state.copyWith(searchQuery: query));
    _searchTimer?.cancel();
    _searchTimer = Timer(searchDelay, () => loadData(reset: true));
  }

  void selectItem(T item) {
    emit(state.copyWith(selectedItem: item));
  }

  @override
  Future<void> close() {
    _searchTimer?.cancel();
    return super.close();
  }
}
