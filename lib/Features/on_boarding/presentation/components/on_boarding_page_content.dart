import 'package:flutter/material.dart';
import 'package:quent/Features/on_boarding/data/models/on_boarding_model.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_text_styles.dart';

class OnBoardingPageContent extends StatelessWidget {
  const OnBoardingPageContent({super.key, required this.onBoardingPageModel});

  final OnBoardingModel onBoardingPageModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          onBoardingPageModel.title,
          style: TextTheme.of(context).displayLarge,
        ),
        const SizedBox(height: 12),
        Text(
          onBoardingPageModel.body,
          style: AppTextStyles.semiBold15.copyWith(
            color: context.myColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
