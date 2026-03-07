import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_color.dart';

class MyColors extends ThemeExtension<MyColors> {
  final AppColors colors;

  const MyColors({required this.colors});

  Color get primary => colors.primary;
  Color get primaryVariant => colors.primaryVariant;
  Color get primarySoft => colors.primarySoft;
  Color get secondary => colors.secondary;
  Color get background => colors.background;
  Color get surface => colors.surface;
  Color get card => colors.card;
  Color get textPrimary => colors.textPrimary;
  Color get textSecondary => colors.textSecondary;
  Color get textHint => colors.textHint;
  Color get textOnPrimary => colors.textOnPrimary;
  Color get success => colors.success;
  Color get warning => colors.warning;
  Color get error => colors.error;
  Color get info => colors.info;
  Color get border => colors.border;
  Color get divider => colors.divider;
  Color get navBackground => colors.navBackground;
  Color get navSelected => colors.navSelected;
  Color get navUnselected => colors.navUnselected;
  Color get shadow => colors.shadow;
  Color get shimmer => colors.shimmer;
  Color get splashBg => colors.splashBg;

  static const MyColors light = MyColors(colors: AppColors.light);
  static const MyColors dark = MyColors(colors: AppColors.dark);

  @override
  MyColors copyWith({AppColors? colors}) {
    return MyColors(colors: colors ?? this.colors);
  }

  @override
  MyColors lerp(covariant MyColors? other, double t) {
    if (other == null) return this;
    return MyColors(
      colors: AppColors(
        primary: Color.lerp(primary, other.primary, t)!,
        primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
        primarySoft: Color.lerp(primarySoft, other.primarySoft, t)!,
        secondary: Color.lerp(secondary, other.secondary, t)!,
        background: Color.lerp(background, other.background, t)!,
        surface: Color.lerp(surface, other.surface, t)!,
        card: Color.lerp(card, other.card, t)!,
        textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
        textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
        textHint: Color.lerp(textHint, other.textHint, t)!,
        textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
        success: Color.lerp(success, other.success, t)!,
        warning: Color.lerp(warning, other.warning, t)!,
        error: Color.lerp(error, other.error, t)!,
        info: Color.lerp(info, other.info, t)!,
        border: Color.lerp(border, other.border, t)!,
        divider: Color.lerp(divider, other.divider, t)!,
        navBackground: Color.lerp(navBackground, other.navBackground, t)!,
        navSelected: Color.lerp(navSelected, other.navSelected, t)!,
        navUnselected: Color.lerp(navUnselected, other.navUnselected, t)!,
        shadow: Color.lerp(shadow, other.shadow, t)!,
        shimmer: Color.lerp(shimmer, other.shimmer, t)!,
        splashBg: Color.lerp(splashBg, other.splashBg, t)!,
      ),
    );
  }
}

extension MyColorsContext on BuildContext {
  MyColors get myColors =>
      Theme.of(this).extension<MyColors>() ?? MyColors.light;
}
