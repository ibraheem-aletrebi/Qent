import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? textColor;
  final IconData? icon;
  final double? borderRadius;
  final Color? borderColor;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height,
    this.backgroundColor,
    this.disabledColor,
    this.textColor,
    this.icon,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled = enabled && !isLoading;
    final colors = context.myColors;
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppSizes.h50,
      child: ElevatedButton.icon(
        onPressed: isButtonEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor:
              disabledColor ?? colors.primary.withValues(alpha: .5),
          backgroundColor: backgroundColor ?? colors.primary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.r8),
          ),
        ),
        icon: isLoading
            ? SizedBox(
                height: AppSizes.w18,
                width: AppSizes.w18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Colors.white,
                  ),
                ),
              )
            : icon != null
            ? Icon(icon)
            : null,
        label: Text(
          text,
          style: AppTextStyles.semiBold15Button.copyWith(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
