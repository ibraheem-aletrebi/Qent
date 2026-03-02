import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_sizes.dart';

class AuthTitleBody extends StatelessWidget {
  const AuthTitleBody({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextTheme.of(context).headlineLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.h16),
        Text(
          body,
          style: TextTheme.of(context).bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
