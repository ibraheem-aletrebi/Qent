import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quent/Features/home/data/models/brands_response_model/brand_model.dart';
import 'package:quent/Features/home/domain/use_cases/fetch_brands_use_case.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit({required FetchBrandsUseCase fetchBrandsUseCase})
    : _fetchBrandsUseCase = fetchBrandsUseCase,
      super(BrandInitial());

  final FetchBrandsUseCase _fetchBrandsUseCase;

  int _page = 1;
  final List<BrandModel> _brands = [];

  Future<void> fetchBrands({bool loadMore = false}) async {
    if (loadMore) {
      emit(BrandLoadingMore(brandList: List.unmodifiable(_brands)));
    } else {
      _page = 1;
      _brands.clear();
      emit(BrandLoading());
    }

    final result = await _fetchBrandsUseCase.call(_page);

    result.when(
      onSuccess: (data) {
        _brands.addAll(data.brands);
        _page++;
        emit(
          BrandLoaded(
            brandList: List.unmodifiable(_brands),
            hasMore: data.meta.currentPage < data.meta.lastPage,
          ),
        );
      },
      onError: (error) {
        if (loadMore) {
          emit(
            BrandLoadingMoreFailure(
              error: error,
              brandList: List.unmodifiable(_brands),
            ),
          );
        } else {
          emit(BrandFailure(error: error));
        }
      },
    );
  }
}
