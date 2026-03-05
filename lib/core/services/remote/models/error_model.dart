import 'package:flutter/material.dart';
import 'package:quent/core/services/remote/api_error_handler.dart';
import 'package:quent/core/services/remote/api_local_status_code.dart';

class ErrorModel {
  final String message;
  final String? action;
  final IconData? icon;
  final ApiLocalStatusCode? statusCode;
  final ApiErrorType? errorType;
  final bool? canRetry;

  const ErrorModel({
    required this.message,
     this.action,
     this.icon,
     this.statusCode,
     this.errorType,
     this.canRetry,
  });

  factory ErrorModel.fromServerResponse(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    return ErrorModel(
      message:
          json['message'] ?? json['detail'] ?? json['title'] ?? 'Unknown error',
      action: 'Please try again',
      icon: _getIconForStatusCode(statusCode),
      statusCode:
          ApiLocalStatusCode.fromCode(statusCode) ??
          ApiLocalStatusCode.defaultError,
      errorType: statusCode >= 500 ? ApiErrorType.server : ApiErrorType.server,
      canRetry: statusCode >= 500 || statusCode == 408 || statusCode == 429,
    );
  }

  static IconData _getIconForStatusCode(int code) {
    switch (code) {
      case 400:
        return Icons.warning_amber_rounded;
      case 401:
        return Icons.lock_outline;
      case 403:
        return Icons.block;
      case 404:
        return Icons.search_off;
      case 408:
        return Icons.timer_off;
      case 409:
        return Icons.sync_problem_rounded;
      case 422:
        return Icons.rule;
      case 429:
        return Icons.speed;
      case 500:
      case 502:
      case 503:
      case 504:
        return Icons.cloud_off;
      default:
        return Icons.error_outline;
    }
  }

  @override
  String toString() {
    return 'ApiErrorModel(message: $message, statusCode: ${statusCode?.code}, errorType: $errorType)';
  }
}
