import 'package:flutter/material.dart';

class AppColors {
  final Color primary;
  final Color primaryVariant;
  final Color primarySoft;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;
  final Color textOnPrimary;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color border;
  final Color divider;
  final Color navBackground;
  final Color navSelected;
  final Color navUnselected;
  final Color shadow;
  final Color shimmer;
  final Color splashBg;

  const AppColors({
    required this.primary,
    required this.primaryVariant,
    required this.primarySoft,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.textOnPrimary,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.border,
    required this.divider,
    required this.navBackground,
    required this.navSelected,
    required this.navUnselected,
    required this.shadow,
    required this.shimmer,
    required this.splashBg,
  });

  static const AppColors light = AppColors(
    primary: Color(0xFF6D4C41),
    primaryVariant: Color(0xFF4E342E),
    primarySoft: Color(0xFFF3EAE6),
    secondary: Color(0xFFC8A96E),
    background: Color(0xFFFAF7F4),
    surface: Color(0xFFFFFFFF),
    card: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF2C1A14),
    textSecondary: Color(0xFF7A5C52),
    textHint: Color(0xFFBCA99F),
    textOnPrimary: Color(0xFFFFFFFF),
    success: Color(0xFF388E3C),
    warning: Color(0xFFF57C00),
    error: Color(0xFFC62828),
    info: Color(0xFF1565C0),
    border: Color(0xFFEDE4DE),
    divider: Color(0xFFEDE4DE),
    navBackground: Color(0xFFFFFFFF),
    navSelected: Color(0xFF6D4C41),
    navUnselected: Color(0xFFBCA99F),
    shadow: Color(0x1A6D4C41),
    shimmer: Color(0xFF6D4C41),
    splashBg: Color(0xFFFFFFFF),
  );

  static const AppColors dark = AppColors(
    primary: Color(0xFFA1695A),
    primaryVariant: Color(0xFF6D4C41),
    primarySoft: Color(0xFF3B2219),
    secondary: Color(0xFFD4A96E),
    background: Color(0xFF1A1410),
    surface: Color(0xFF26201C),
    card: Color(0xFF2E2420),
    textPrimary: Color(0xFFF5EDE8),
    textSecondary: Color(0xFFBFA99A),
    textHint: Color(0xFF7A6560),
    textOnPrimary: Color(0xFFFFFFFF),
    success: Color(0xFF66BB6A),
    warning: Color(0xFFFFB74D),
    error: Color(0xFFEF5350),
    info: Color(0xFF42A5F5),
    border: Color(0xFF3A2E28),
    divider: Color(0xFF3A2E28),
    navBackground: Color(0xFF26201C),
    navSelected: Color(0xFFA1695A),
    navUnselected: Color(0xFF7A6560),
    shadow: Color(0x40A1695A),
    shimmer: Color(0xFFA1695A),
    splashBg: Color(0xFF1A1410),
  );
}
