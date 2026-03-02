import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/language_cubit/language_cubit.dart';
import 'package:quent/core/cubits/language_cubit/language_state.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/generated/l10n.dart';

class LanguageDropdownMenu extends StatelessWidget {
  const LanguageDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final currentLang = state.languageCode;
        return DropdownButton<String>(
          barrierDismissible: true,
          style: TextTheme.of(context).titleLarge,
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            color: context.watch<ThemeCubit>().isDarkMode
                ? Colors.white
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(AppSizes.r8),
          value: currentLang,
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              context.read<LanguageCubit>().changeLanguage(newValue);
            }
          },
          items: [
            DropdownMenuItem(value: 'en', child: Text(S.of(context).En)),
            DropdownMenuItem(value: 'ar', child: Text(S.of(context).Ar)),
          ],
        );
      },
    );
  }
}
