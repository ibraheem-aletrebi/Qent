import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/app_text_styles.dart';

class AuthActionPrompt extends StatelessWidget {
  final String leadingText;
  final String actionText;
  final VoidCallback? onActionTap;
  final TextStyle? leadingStyle;
  final TextStyle? actionStyle;

  const AuthActionPrompt({
    super.key,
    required this.leadingText,
    required this.actionText,
    this.onActionTap,
    this.leadingStyle,
    this.actionStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultLeadingStyle = leadingStyle ?? AppTextStyles.regular14;
    final defaultActionStyle =
        actionStyle ??
        AppTextStyles.semiBold14.copyWith(color: context.myColors.primary);
    return SizedBox(
      height: AppSizes.h65,
      child: Center(
        child: GestureDetector(
          onTap: onActionTap,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: leadingText, style: defaultLeadingStyle),
                WidgetSpan(child: SizedBox(width: AppSizes.w8)),
                TextSpan(text: actionText, style: defaultActionStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
