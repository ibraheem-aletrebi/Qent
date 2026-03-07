import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/home/data/models/car_response_model/image_model.dart';

part 'images_slider_state.dart';

class ImagesSliderCubit extends Cubit<ImagesSliderState> {
  ImagesSliderCubit() : super(ImagesSliderInitial());

  final PageController pageController = PageController();
  final ScrollController thumbScroll = ScrollController();

  List<ImageModel> _images = [];
  int _currentIndex = 0;

  List<ImageModel> get images => List.unmodifiable(_images);
  int get currentIndex => _currentIndex;

  void init({required List<ImageModel> images}) {
    _images = List.of(images);
    _currentIndex = 0;

    emit(ImagesSliderChanged(currentIndex: 0, images: _images));
  }

  void goToImage(int index) {
    if (index < 0 || index >= _images.length) return;
    _currentIndex = index;
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    }

    if (thumbScroll.hasClients) {
      thumbScroll.animateTo(
        index * 88.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    emit(ImagesSliderChanged(currentIndex: _currentIndex, images: _images));
  }

  void onPageSwiped(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    if (thumbScroll.hasClients) {
      thumbScroll.animateTo(
        index * 88.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    emit(ImagesSliderChanged(currentIndex: _currentIndex, images: _images));
  }

  @override
  Future<void> close() async {
    pageController.dispose();
    thumbScroll.dispose();
    return super.close();
  }
}
