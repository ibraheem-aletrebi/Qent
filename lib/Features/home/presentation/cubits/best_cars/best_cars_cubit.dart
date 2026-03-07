import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/Features/home/domain/use_cases/fetch_best_cars_use_case.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'best_cars_state.dart';

class BestCarsCubit extends Cubit<BestCarsState> {
  BestCarsCubit({required FetchBestCarsUseCase fetchBestCarsUseCase})
      : _fetchBestCarsUseCase = fetchBestCarsUseCase,
        super(BestCarsInitial());

  final FetchBestCarsUseCase _fetchBestCarsUseCase;

  int _page = 1;
  final List<CarModel> _cars = []; 

  Future<void> fetchBestCars({bool loadMore = false}) async {
    if (loadMore) {
      emit(BestCarsLoadingMore(cars: List.unmodifiable(_cars)));
    } else {
      _page = 1;
      _cars.clear();
      emit(BestCarsLoading());
    }

    final result = await _fetchBestCarsUseCase.call(_page);

    result.when(
      onSuccess: (data) {
        _cars.addAll(data.cars);
        _page++;
        emit(
          BestCarsLoaded(
            cars: List.unmodifiable(_cars),
            hasMore: data.meta.currentPage < data.meta.lastPage,
          ),
        );
      },
      onError: (error) {
        if (loadMore) {
          emit(
            BestCarsLoadingMoreFailure(
              error: error,
              cars: List.unmodifiable(_cars),
            ),
          );
        } else {
          emit(BestCarsFailure(error: error));
        }
      },
    );
  }
}