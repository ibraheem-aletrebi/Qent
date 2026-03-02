import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';

class LinearGradientContainer extends StatelessWidget {
  const LinearGradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: context.watch<ThemeCubit>().isDarkMode
              ? [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.9),
                  Colors.black,
                ]
              : [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.white.withValues(alpha: 0.1),
                  Colors.white.withValues(alpha: 0.2),
                  Colors.white.withValues(alpha: 0.7),
                  Colors.white.withValues(alpha: 0.9),
                  Colors.white,
                ],
        ),
      ),
    );
  }
}
