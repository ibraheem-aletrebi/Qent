part of 'brand_cubit.dart';

sealed class BrandState extends Equatable {
  const BrandState();

  @override
  List<Object> get props => [];
}

final class BrandInitial extends BrandState {}

final class BrandLoading extends BrandState {}

final class BrandLoadingMore extends BrandState {
  final List<BrandModel> brandList;

  const BrandLoadingMore({required this.brandList});

  @override
  List<Object> get props => [brandList];
}

final class BrandLoadingMoreFailure extends BrandState {
  final ErrorModel error;
  final List<BrandModel> brandList;

  const BrandLoadingMoreFailure({required this.error, required this.brandList});

  @override
  List<Object> get props => [error, brandList];
}

final class BrandLoaded extends BrandState {
  final List<BrandModel> brandList;
  final bool hasMore;

  const BrandLoaded({required this.brandList, required this.hasMore});

  @override
  List<Object> get props => [brandList, hasMore];
}

final class BrandFailure extends BrandState {
  final ErrorModel error;

  const BrandFailure({required this.error});

  @override
  List<Object> get props => [error];
}
