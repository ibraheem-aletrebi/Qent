import 'package:flutter/material.dart';
import 'package:quent/Features/on_boarding/data/models/on_boarding_model.dart';

class OnBoardingPageContent extends StatelessWidget {
  const OnBoardingPageContent({super.key, required this.onBoardingPageModel});

  final OnBoardingModel onBoardingPageModel;
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(onBoardingPageModel.title, style: textTheme.displayLarge),
        const SizedBox(height: 12),
        Text(onBoardingPageModel.body, style: textTheme.titleLarge),
      ],
    );
  }
}
