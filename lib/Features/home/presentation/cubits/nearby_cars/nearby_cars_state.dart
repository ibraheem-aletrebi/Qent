part of 'nearby_cars_cubit.dart';

sealed class NearbyCarsState extends Equatable {
  const NearbyCarsState();

  @override
  List<Object> get props => [];
}

final class NearbyCarsInitial extends NearbyCarsState {}

final class NearbyCarsLoading extends NearbyCarsState {}

final class NearbyCarsLoaded extends NearbyCarsState {
  final List<CarModel> cars;
  final bool hasMore;
  const NearbyCarsLoaded({required this.cars, required this.hasMore});
}

final class NearbyCarsLoadingMore extends NearbyCarsState {
  final List<CarModel> cars;
  const NearbyCarsLoadingMore({required this.cars});
}

final class NearbyCarsLoadingMoreFailure extends NearbyCarsState {
  final ErrorModel error;
  final List<CarModel> cars;
  const NearbyCarsLoadingMoreFailure({required this.cars, required this.error});
}

class NearbyCarsFailure extends NearbyCarsState {
  final ErrorModel error;
  const NearbyCarsFailure({required this.error});
}
