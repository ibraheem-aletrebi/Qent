import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quent/Features/home/data/models/car_response_model/car_model.dart';
import 'package:quent/Features/home/domain/use_cases/fetch_nearby_cars_use_case.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'nearby_cars_state.dart';

class NearbyCarsCubit extends Cubit<NearbyCarsState> {
  NearbyCarsCubit({required FetchNearbyCarsUseCase fetchNearbyCarsUseCase})
    : _fetchNearbyCarsUseCase = fetchNearbyCarsUseCase,
      super(NearbyCarsInitial());

  final FetchNearbyCarsUseCase _fetchNearbyCarsUseCase;

  int _page = 1;
  final List<CarModel> _cars = [];
  Future<void> fetchNearbyCars({bool loadMore = false}) async {
    if (loadMore) {
      emit(NearbyCarsLoadingMore(cars: List.unmodifiable(_cars)));
    } else {
      _page = 1;
      _cars.clear();
      emit(NearbyCarsLoading());
    }

    final result = await _fetchNearbyCarsUseCase.call(_page);

    result.when(
      onSuccess: (data) {
        _cars.addAll(data.cars);
        _page++;
        emit(
          NearbyCarsLoaded(
            cars: List.unmodifiable(_cars),
            hasMore: data.meta.currentPage < data.meta.lastPage,
          ),
        );
      },
      onError: (error) {
        if (loadMore) {
          emit(
            NearbyCarsLoadingMoreFailure(
              error: error,
              cars: List.unmodifiable(_cars),
            ),
          );
        } else {
          emit(NearbyCarsFailure(error: error));
        }
      },
    );
  }
}
