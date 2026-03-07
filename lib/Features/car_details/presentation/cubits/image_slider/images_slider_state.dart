part of 'images_slider_cubit.dart';

sealed class ImagesSliderState extends Equatable {
  const ImagesSliderState({this.images = const [], this.currentIndex = 0});
  final List<ImageModel> images;
  final int currentIndex;
  @override
  List<Object> get props => [images, currentIndex];
}

final class ImagesSliderInitial extends ImagesSliderState {}

final class ImagesSliderChanged extends ImagesSliderState {
  const ImagesSliderChanged({
    required super.images,
    required super.currentIndex,
  });
}
