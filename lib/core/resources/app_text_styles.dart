import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_color.dart';

import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/font_weight_helper.dart';

class AppTextStyles {
  static const String _f = 'Alexandria';

  // Display
  static TextStyle get extraBold32 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp32,
    fontWeight: FontWeightHelper.extraBold,
    height: 1.2,
  );
  static TextStyle get bold28 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp28,
    fontWeight: FontWeightHelper.bold,
    height: 1.2,
  );
  static TextStyle get bold24 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp24,
    fontWeight: FontWeightHelper.bold,
    height: 1.3,
  );

  // Headline
  static TextStyle get bold22 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp22,
    fontWeight: FontWeightHelper.bold,
    height: 1.3,
  );
  static TextStyle get semiBold20 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp20,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.3,
  );
  static TextStyle get semiBold18 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp18,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );

  // Title
  static TextStyle get bold18 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp18,
    fontWeight: FontWeightHelper.bold,
    height: 1.4,
  );
  static TextStyle get bold16 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp16,
    fontWeight: FontWeightHelper.bold,
    height: 1.4,
  );
  static TextStyle get bold14 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp14,
    fontWeight: FontWeightHelper.bold,
    height: 1.4,
  );
  static TextStyle get semiBold16 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp16,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.1,
  );
  static TextStyle get semiBold15 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp15,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );
  static TextStyle get semiBold14 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp14,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );
  static TextStyle get semiBold13 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp13,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );
  static TextStyle get semiBold12 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp12,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );
  static TextStyle get semiBold11 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp11,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );
  static TextStyle get semiBold10 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp10,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );
  static TextStyle get semiBold9 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp9,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );

  // Body
  static TextStyle get regular16 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp16,
    fontWeight: FontWeightHelper.regular,
    height: 1.6,
  );
  static TextStyle get regular15 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp15,
    fontWeight: FontWeightHelper.regular,
    height: 1.6,
  );
  static TextStyle get regular14 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp14,
    fontWeight: FontWeightHelper.regular,
    height: 1.6,
  );
  static TextStyle get regular13 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp13,
    fontWeight: FontWeightHelper.regular,
    height: 1.5,
  );
  static TextStyle get regular12 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp12,
    fontWeight: FontWeightHelper.regular,
    height: 1.5,
  );
  static TextStyle get regular11 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp11,
    fontWeight: FontWeightHelper.regular,
    height: 1.5,
  );
  static TextStyle get regular10 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp10,
    fontWeight: FontWeightHelper.regular,
    height: 1.5,
  );
  static TextStyle get regular9 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp9,
    fontWeight: FontWeightHelper.regular,
    height: 1.5,
  );

  // Label / Spaced
  static TextStyle get semiBold14Spaced => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp14,
    fontWeight: FontWeightHelper.semiBold,
    letterSpacing: 0.1,
  );
  static TextStyle get medium13 => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp13,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle get medium12Spaced => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp12,
    fontWeight: FontWeightHelper.medium,
    letterSpacing: 0.1,
  );
  static TextStyle get medium11Spaced => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp11,
    fontWeight: FontWeightHelper.medium,
    letterSpacing: 0.2,
  );

  // Navigation
  static TextStyle get semiBold11Nav => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp11,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle get regular11Nav => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp11,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle get bold11Nav => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp11,
    fontWeight: FontWeightHelper.bold,
  );

  // Shortcuts
  static TextStyle get extraBold18Primary => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp18,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColors.light.primary,
    height: 1.2,
  );
  static TextStyle get semiBold14Product => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp14,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.4,
  );

  static TextStyle get bold10Badge => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp10,
    fontWeight: FontWeightHelper.bold,
    letterSpacing: 0.3,
  );
  static TextStyle get semiBold15Button => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp15,
    fontWeight: FontWeightHelper.semiBold,
    letterSpacing: 0.2,
    height: 1.2,
  );
  static TextStyle get bold18AppBar => TextStyle(
    fontFamily: _f,
    fontSize: AppSizes.sp18,
    fontWeight: FontWeightHelper.bold,
  );
}
