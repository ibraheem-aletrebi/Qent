import 'package:flutter/material.dart';
import 'package:quent/core/services/remote/api_error_handler.dart';
import 'package:quent/core/services/remote/models/error_model.dart';
import 'package:quent/core/services/remote/api_local_status_code.dart';

class ApiErrorFactory {
  static const ErrorModel defaultError = ErrorModel(
    message: 'Something went wrong',
    action: 'Please try again',
    icon: Icons.error_outline,
    statusCode: ApiLocalStatusCode.defaultError,
    errorType: ApiErrorType.unknown,
    canRetry: true,
  );
}
