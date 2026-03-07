part of 'best_cars_cubit.dart';

sealed class BestCarsState extends Equatable {
  const BestCarsState();

  @override
  List<Object> get props => [];
}

final class BestCarsInitial extends BestCarsState {}

final class BestCarsLoading extends BestCarsState {}

final class BestCarsLoaded extends BestCarsState {
  final List<CarModel> cars;
  final bool hasMore;

  const BestCarsLoaded({required this.cars, required this.hasMore});

  @override
  List<Object> get props => [cars, hasMore];
}

final class BestCarsFailure extends BestCarsState {
  final ErrorModel error;

  const BestCarsFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class BestCarsLoadingMore extends BestCarsState {
  final List<CarModel> cars;

  const BestCarsLoadingMore({required this.cars});

  @override
  List<Object> get props => [cars];
}

final class BestCarsLoadingMoreFailure extends BestCarsState {
  final ErrorModel error;
  final List<CarModel> cars;

  const BestCarsLoadingMoreFailure({required this.error, required this.cars});

  @override
  List<Object> get props => [error, cars];
}