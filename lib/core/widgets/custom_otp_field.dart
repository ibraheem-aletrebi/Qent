import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quent/core/resources/app_sizes.dart';


class CustomOTPField extends StatelessWidget {
  final int length;
  final TextEditingController controller;
  final GlobalKey<FormState>? formKey;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextDirection? textDirection;
  final Color? cursorColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? submittedBackgroundColor;

  const CustomOTPField({
    super.key,
    required this.controller,
    this.formKey,
    this.onCompleted,
    this.onChanged,
    this.validator,
    this.length = 4,
    this.textDirection,
    this.cursorColor,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.submittedBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final defaultPinTheme = PinTheme(
      width: width ?? AppSizes.w48,
      height: height ??  AppSizes.w48,
      textStyle: theme.textTheme.titleLarge,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.r12),
        border: Border.all(color: borderColor ?? colorScheme.outline, width: 2),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: focusedBorderColor ?? colorScheme.primary,
          width: 2,
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: submittedBackgroundColor ?? colorScheme.surface,
        border: Border.all(
          color: focusedBorderColor ?? colorScheme.primary,
          width: 2,
        ),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: errorBorderColor ?? colorScheme.error,
          width: 2,
        ),
      ),
    );

    return Pinput(
      controller: controller,
      length: length,
      separatorBuilder: (index) => const SizedBox(width: 8),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      validator: validator,
      onCompleted: onCompleted,
      onChanged: onChanged,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: AppSizes.w24,
            height: 2,
            color: cursorColor ?? colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
