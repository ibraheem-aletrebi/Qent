import 'package:flutter/material.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});
  final ErrorModel error;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Icon(error.icon, color: Colors.red),
        Text(error.message, style: TextTheme.of(context).titleMedium),
        if (error.action != null)
          Text(error.action!, style: TextTheme.of(context).titleSmall),
      ],
    );
  }
}
