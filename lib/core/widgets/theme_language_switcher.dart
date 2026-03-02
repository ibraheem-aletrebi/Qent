import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/animation/rotate_animation.dart';
import 'package:quent/core/animation/slide_in_widget.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/widgets/language_dropdown_menu.dart';

class ThemeLanguageSwitcher extends StatelessWidget {
  const ThemeLanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().isDarkMode;
    return SlideInWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LanguageDropdownMenu(),
          RotateAnimation(
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: context.myColors.surface,
              ),
              key: ValueKey(isDarkMode),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              icon: Icon(
                isDarkMode ? Icons.light : Icons.light_outlined,
                size: AppSizes.sp28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
