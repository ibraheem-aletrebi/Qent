import 'package:flutter/material.dart';
import 'package:quent/core/extensions/color_extension.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/resources/app_text_styles.dart';


class AppTheme {
  static const String _fontFamily = 'Alexandria';
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    extensions: const [MyColors.light],

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.light.primary,
      onPrimary: AppColors.light.textOnPrimary,
      primaryContainer: AppColors.light.primarySoft,
      onPrimaryContainer: AppColors.light.primaryVariant,
      secondary: AppColors.light.secondary,
      onSecondary: Colors.white,
      error: AppColors.light.error,
      onError: Colors.white,
      surface: AppColors.light.surface,
      onSurface: AppColors.light.textPrimary,
      surfaceContainerHighest: AppColors.light.background,
      outline: AppColors.light.border,
      shadow: AppColors.light.shadow,
      outlineVariant: AppColors.light.divider,
      scrim: AppColors.light.shadow,
    ),

    scaffoldBackgroundColor: AppColors.light.background,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.light.surface,
      foregroundColor: AppColors.light.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 1,
      shadowColor: AppColors.light.shadow,
      centerTitle: true,
      titleTextStyle: AppTextStyles.bold18AppBar.copyWith(
        color: AppColors.light.textPrimary,
      ),
      iconTheme: IconThemeData(color: AppColors.light.textPrimary),
      actionsIconTheme: IconThemeData(color: AppColors.light.textPrimary),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.light.navBackground,
      selectedItemColor: AppColors.light.navSelected,
      unselectedItemColor: AppColors.light.navUnselected,
      type: BottomNavigationBarType.fixed,
      elevation: 12,
      selectedLabelStyle: AppTextStyles.semiBold11Nav,
      unselectedLabelStyle: AppTextStyles.regular11Nav,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.light.navBackground,
      indicatorColor: AppColors.light.primarySoft,
      shadowColor: AppColors.light.shadow,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: AppColors.light.navSelected, size: 24);
        }
        return IconThemeData(color: AppColors.light.navUnselected, size: 22);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTextStyles.bold11Nav.copyWith(
            color: AppColors.light.navSelected,
          );
        }
        return AppTextStyles.regular11Nav.copyWith(
          color: AppColors.light.navUnselected,
        );
      }),
      elevation: 8,
      height: 64,
    ),

    cardTheme: CardThemeData(
      color: AppColors.light.card,
      elevation: 2,
      shadowColor: AppColors.light.shadow,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        side: BorderSide(color: AppColors.light.border, width: 0.5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.light.primary,
        foregroundColor: AppColors.light.textOnPrimary,
        disabledBackgroundColor: AppColors.light.border,
        disabledForegroundColor: AppColors.light.textHint,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h14,
          horizontal: AppSizes.w24,
        ),
        elevation: 2,
        shadowColor: AppColors.light.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        textStyle: AppTextStyles.semiBold15Button,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.light.primary,
        disabledForegroundColor: AppColors.light.textHint,
        side: BorderSide(color: AppColors.light.primary, width: 1.5),
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h14,
          horizontal: AppSizes.w24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        textStyle: AppTextStyles.semiBold15Button,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.light.primary,
        textStyle: AppTextStyles.semiBold14,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.light.surface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.light.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.light.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.light.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.light.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.light.error, width: 2),
      ),
      hintStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.light.textHint,
      ),
      labelStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.light.textSecondary,
      ),
      errorStyle: AppTextStyles.regular12.copyWith(
        color: AppColors.light.error,
      ),
      prefixIconColor: AppColors.light.textHint,
      suffixIconColor: AppColors.light.textHint,
    ),

    textTheme: TextTheme(
      displayLarge: AppTextStyles.extraBold32.copyWith(
        color: AppColors.light.textPrimary,
      ),
      displayMedium: AppTextStyles.bold28.copyWith(
        color: AppColors.light.textPrimary,
      ),
      displaySmall: AppTextStyles.bold24.copyWith(
        color: AppColors.light.textPrimary,
      ),
      headlineLarge: AppTextStyles.bold22.copyWith(
        color: AppColors.light.textPrimary,
      ),
      headlineMedium: AppTextStyles.semiBold20.copyWith(
        color: AppColors.light.textPrimary,
      ),
      headlineSmall: AppTextStyles.semiBold18.copyWith(
        color: AppColors.light.textPrimary,
      ),
      titleLarge: AppTextStyles.bold16.copyWith(
        color: AppColors.light.textPrimary,
      ),
      titleMedium: AppTextStyles.semiBold15.copyWith(
        color: AppColors.light.textPrimary,
      ),
      titleSmall: AppTextStyles.semiBold14.copyWith(
        color: AppColors.light.textSecondary,
      ),
      bodyLarge: AppTextStyles.regular16.copyWith(
        color: AppColors.light.textPrimary,
      ),
      bodyMedium: AppTextStyles.regular14.copyWith(
        color: AppColors.light.textSecondary,
      ),
      bodySmall: AppTextStyles.regular12.copyWith(
        color: AppColors.light.textHint,
      ),
      labelLarge: AppTextStyles.semiBold14Spaced.copyWith(
        color: AppColors.light.textPrimary,
      ),
      labelMedium: AppTextStyles.medium12Spaced.copyWith(
        color: AppColors.light.textSecondary,
      ),
      labelSmall: AppTextStyles.medium11Spaced.copyWith(
        color: AppColors.light.textHint,
      ),
    ),

    dividerColor: AppColors.light.divider,
    dividerTheme: DividerThemeData(
      color: AppColors.light.divider,
      thickness: 1,
      space: 1,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.light.primarySoft,
      selectedColor: AppColors.light.primary,
      disabledColor: AppColors.light.border,
      labelStyle: AppTextStyles.medium13.copyWith(
        color: AppColors.light.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      side: BorderSide(color: AppColors.light.border),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w8,
        vertical: AppSizes.h4,
      ),
    ),

    iconTheme: IconThemeData(color: AppColors.light.textSecondary, size: 24),

    listTileTheme: ListTileThemeData(
      tileColor: AppColors.light.surface,
      iconColor: AppColors.light.textSecondary,
      textColor: AppColors.light.textPrimary,
      subtitleTextStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.light.textSecondary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.light.surface;
        }
        return AppColors.light.textHint;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.light.primary;
        }
        return AppColors.light.border;
      }),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.light.textPrimary,
      contentTextStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.light.surface,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      behavior: SnackBarBehavior.floating,
      actionTextColor: AppColors.light.primary,
    ),

    badgeTheme: BadgeThemeData(
      backgroundColor: AppColors.light.primary,
      textColor: AppColors.light.textOnPrimary,
      smallSize: 8,
      largeSize: 18,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.light.primary,
        foregroundColor: AppColors.light.textOnPrimary,
        disabledBackgroundColor: AppColors.light.border,
        disabledForegroundColor: AppColors.light.textHint,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h14,
          horizontal: AppSizes.w24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        textStyle: AppTextStyles.semiBold15Button,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: _fontFamily,

    extensions: const [MyColors.dark],

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.dark.primary,
      onPrimary: AppColors.dark.textOnPrimary,
      primaryContainer: AppColors.dark.primarySoft,
      onPrimaryContainer: AppColors.dark.primary,
      secondary: AppColors.dark.secondary,
      onSecondary: Colors.black,
      error: AppColors.dark.error,
      onError: Colors.black,
      surface: AppColors.dark.surface,
      onSurface: AppColors.dark.textPrimary,
      surfaceContainerHighest: AppColors.dark.background,
      outline: AppColors.dark.border,
      shadow: AppColors.dark.shadow,
      outlineVariant: AppColors.dark.divider,
      scrim: AppColors.dark.shadow,
    ),

    scaffoldBackgroundColor: AppColors.dark.background,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark.surface,
      foregroundColor: AppColors.dark.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 1,
      shadowColor: AppColors.dark.shadow,
      centerTitle: true,
      titleTextStyle: AppTextStyles.bold18AppBar.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      iconTheme: IconThemeData(color: AppColors.dark.textPrimary),
      actionsIconTheme: IconThemeData(color: AppColors.dark.textPrimary),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark.navBackground,
      selectedItemColor: AppColors.dark.navSelected,
      unselectedItemColor: AppColors.dark.navUnselected,
      type: BottomNavigationBarType.fixed,
      elevation: 12,
      selectedLabelStyle: AppTextStyles.semiBold11Nav,
      unselectedLabelStyle: AppTextStyles.regular11Nav,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.dark.navBackground,
      indicatorColor: AppColors.dark.primarySoft,
      shadowColor: AppColors.dark.shadow,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: AppColors.dark.navSelected, size: 24);
        }
        return IconThemeData(color: AppColors.dark.navUnselected, size: 22);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTextStyles.bold11Nav.copyWith(
            color: AppColors.dark.navSelected,
          );
        }
        return AppTextStyles.regular11Nav.copyWith(
          color: AppColors.dark.navUnselected,
        );
      }),
      elevation: 8,
      height: 64,
    ),

    cardTheme: CardThemeData(
      color: AppColors.dark.card,
      elevation: 2,
      shadowColor: AppColors.dark.shadow,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        side: BorderSide(color: AppColors.dark.border, width: 0.5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.dark.primary,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.dark.border,
        disabledForegroundColor: AppColors.dark.textHint,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h14,
          horizontal: AppSizes.w24,
        ),
        elevation: 2,
        shadowColor: AppColors.dark.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        textStyle: AppTextStyles.semiBold15Button,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.dark.primary,
        disabledForegroundColor: AppColors.dark.textHint,
        side: BorderSide(color: AppColors.dark.primary, width: 1.5),
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h14,
          horizontal: AppSizes.w24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        textStyle: AppTextStyles.semiBold15Button,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.dark.primary,
        textStyle: AppTextStyles.semiBold14,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dark.surface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.dark.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.dark.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.dark.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.dark.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        borderSide: BorderSide(color: AppColors.dark.error, width: 2),
      ),
      hintStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.dark.textHint,
      ),
      labelStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.dark.textSecondary,
      ),
      errorStyle: AppTextStyles.regular12.copyWith(color: AppColors.dark.error),
      prefixIconColor: AppColors.dark.textHint,
      suffixIconColor: AppColors.dark.textHint,
    ),

    textTheme: TextTheme(
      displayLarge: AppTextStyles.extraBold32.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      displayMedium: AppTextStyles.bold28.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      displaySmall: AppTextStyles.bold24.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      headlineLarge: AppTextStyles.bold22.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      headlineMedium: AppTextStyles.semiBold20.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      headlineSmall: AppTextStyles.semiBold18.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      titleLarge: AppTextStyles.bold16.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      titleMedium: AppTextStyles.semiBold15.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      titleSmall: AppTextStyles.semiBold14.copyWith(
        color: AppColors.dark.textSecondary,
      ),
      bodyLarge: AppTextStyles.regular16.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      bodyMedium: AppTextStyles.regular14.copyWith(
        color: AppColors.dark.textSecondary,
      ),
      bodySmall: AppTextStyles.regular12.copyWith(
        color: AppColors.dark.textHint,
      ),
      labelLarge: AppTextStyles.semiBold14Spaced.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      labelMedium: AppTextStyles.medium12Spaced.copyWith(
        color: AppColors.dark.textSecondary,
      ),
      labelSmall: AppTextStyles.medium11Spaced.copyWith(
        color: AppColors.dark.textHint,
      ),
    ),

    dividerColor: AppColors.dark.divider,
    dividerTheme: DividerThemeData(
      color: AppColors.dark.divider,
      thickness: 1,
      space: 1,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.dark.primarySoft,
      selectedColor: AppColors.dark.primary,
      disabledColor: AppColors.dark.border,
      labelStyle: AppTextStyles.medium13.copyWith(
        color: AppColors.dark.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      side: BorderSide(color: AppColors.dark.border),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w8,
        vertical: AppSizes.h4,
      ),
    ),

    iconTheme: IconThemeData(color: AppColors.dark.textSecondary, size: 24),

    listTileTheme: ListTileThemeData(
      tileColor: AppColors.dark.surface,
      iconColor: AppColors.dark.textSecondary,
      textColor: AppColors.dark.textPrimary,
      subtitleTextStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.dark.textSecondary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.dark.textOnPrimary;
        }
        return AppColors.dark.textHint;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.dark.primary;
        }
        return AppColors.dark.border;
      }),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.dark.card,
      contentTextStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.dark.textPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      behavior: SnackBarBehavior.floating,
      actionTextColor: AppColors.dark.primary,
    ),

    badgeTheme: BadgeThemeData(
      backgroundColor: AppColors.dark.primary,
      textColor: AppColors.dark.textOnPrimary,
      smallSize: 8,
      largeSize: 18,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.dark.primary,
        foregroundColor: AppColors.dark.textOnPrimary,
        disabledBackgroundColor: AppColors.dark.border,
        disabledForegroundColor: AppColors.dark.textHint,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.h14,
          horizontal: AppSizes.w24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        textStyle: AppTextStyles.semiBold15Button,
      ),
    ),
  );
}
