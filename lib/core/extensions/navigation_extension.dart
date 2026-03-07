import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return Navigator.of(
      this,
    ).pushReplacement(MaterialPageRoute(builder: (_) => page), result: result);
  }

  /// ✅ NEW: pushReplacementNamed
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments, result: result);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  bool canPop() {
    return Navigator.of(this).canPop();
  }
}
