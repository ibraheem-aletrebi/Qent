import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/on_boarding/data/models/on_boarding_model.dart';
import 'package:quent/Features/on_boarding/presentation/cubits/on_boarding_cubits/on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  List<OnBoardingModel>? pages;
  final PageController controller = PageController();
  int currentPageIndex = 0;

  void onPageChanged(int index, BuildContext context) {
    currentPageIndex = index;
    emit(OnBoardingUpdated());
  }

  double getProgressValue() {
    if (pages == null || pages!.isEmpty) return 0.0;
    return (currentPageIndex + 1) / pages!.length;
  }

  void goToNextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void goToLastPage() {
    controller.animateToPage(
      pages!.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  bool isLastPage() {
    return currentPageIndex == pages!.length - 1;
  }

  void precacheImages(BuildContext context) {
    for (int i = 0; i < pages!.length; i++) {
      precacheImage(AssetImage(pages![i].image), context);
    }
  }
}
