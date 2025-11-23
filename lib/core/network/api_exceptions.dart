import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handlerError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    final serverMessage = (data is Map && data['message'] != null)
        ? data['message'].toString()
        : null;

    if (serverMessage != null) {
      return ApiError(message: serverMessage, statusCode: statusCode);
    }

    if (statusCode == 409 || statusCode == 422 || statusCode == 400) {
      return ApiError(
        message: 'Email already exists or invalid input',
        statusCode: statusCode,
      );
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timed out. Please try again.');

      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Request timed out while sending data.');

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Server took too long to respond.');

      case DioExceptionType.badCertificate:
        return ApiError(message: 'Certificate error. Please try again later.');

      case DioExceptionType.badResponse:
        return ApiError(
          message: serverMessage ?? 'Bad response from server',

          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        return ApiError(message: 'Request was cancelled.');

      case DioExceptionType.connectionError:
        return ApiError(message: 'Network connection lost.');

      case DioExceptionType.unknown:
        return ApiError(message: 'Please check your internet connection.');

      default:
        return ApiError(message: 'Something went wrong. Please try again.');
    }
  }
}
