import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handlerError(DioException error) {
    final statusCode=error.response?.statusCode;
    final data =error.response?.data;
    if(data is Map<String,dynamic>&&data['message']!=null){
      return ApiError(message: data['message'],statusCode: statusCode);
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timed out. Please try again.');

      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Request timed out while sending data.');

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Server took too long to respond.');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final serverMessage = error.response?.data['message'] ?? 'Bad response from server.';
        return ApiError(
          message: 'Error $statusCode: $serverMessage',
        );

      case DioExceptionType.cancel:
        return ApiError(message: 'Request was cancelled.');

      case DioExceptionType.unknown:
        return ApiError(message: 'Please check your internet connection.');

      default:
        return ApiError(message: 'Something went wrong. Please try again.');
    }
  }
}
