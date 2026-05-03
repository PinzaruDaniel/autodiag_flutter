import 'package:dio/dio.dart';

class Failure {
  final String message;
  final String? code;
  final String? type;
  final dynamic originalError;
  final Map<String, dynamic>? details;

  const Failure({
    required this.message,
    this.code,
    this.type,
    this.originalError,
    this.details,
  });

  factory Failure.dio(DioException e) {
    final response = e.response;
    final data = response?.data;

    String? apiMessage;
    if (data is Map<String, dynamic>) {
      apiMessage = (data['detail'] ?? data['message'] ?? data['error'])?.toString();
    } else if (data is String && data.trim().isNotEmpty) {
      apiMessage = data;
    }

    String message;
    if (apiMessage != null && apiMessage.isNotEmpty) {
      message = apiMessage;
    } else if (response?.statusCode == 401) {
      message = 'Unauthorized. Please check your credentials.';
    } else if (response?.statusCode == 403) {
      message = 'Forbidden. You do not have access to this resource.';
    } else if (response?.statusCode == 404) {
      message = 'Error 404. Resource not found or there are no products';
    } else if (response?.statusCode == 503) {
      message = 'Service unavailable. Error 503';
    } else if (response?.statusMessage != null && response!.statusMessage!.isNotEmpty) {
      message = response.statusMessage!;
    } else {
      message = 'Network Error';
    }

    return Failure(
      message: message,
      code: response?.statusCode?.toString(),
      type: 'dio_${e.type.toString().split('.').last}',
      originalError: e,
      details: {
        'response': response?.data,
        'stackTrace': e.stackTrace.toString(),
      },
    );
  }

  factory Failure.error(Object e, [StackTrace? stackTrace]) {
    return Failure(
      message: e.toString(),
      type: 'error',
      originalError: e,
      details: {
        'stackTrace': stackTrace?.toString() ?? 'No stack trace',
      },
    );
  }
}
