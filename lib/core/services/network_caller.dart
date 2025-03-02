import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:planiq/core/services/Auth_service.dart';
import '../models/response_data.dart';

class NetworkCaller {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  Future<ResponseData> getRequest(String endpoint, {String? token}) async {
    return await _sendRequest(endpoint, method: 'GET', token: token);
  }

  Future<ResponseData> postRequest(String endpoint,
      {Map<String, dynamic>? body, String? token}) async {
    return await _sendRequest(endpoint,
        method: 'POST', body: body, token: token);
  }

  Future<ResponseData> putRequest(String endpoint,
      {Map<String, dynamic>? body, String? token}) async {
    return await _sendRequest(endpoint,
        method: 'PUT', body: body, token: token);
  }

  Future<ResponseData> deleteRequest(String endpoint, {String? token}) async {
    return await _sendRequest(endpoint, method: 'DELETE', token: token);
  }

  /// 🔹 Centralized Request Handler
  Future<ResponseData> _sendRequest(
    String endpoint, {
    required String method,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      log('$method Request: $endpoint');
      if (body != null) log('Request Body: $body');

      Response response = await _dio.request(
        endpoint,
        options: Options(
          method: method,
          headers: {'Authorization': token ?? ''},
        ),
        data: body,
      );

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// 🔹 Response Handling
  ResponseData _handleResponse(Response response) {
    log('Response Status: ${response.statusCode}');
    log('Response Data: ${response.data}');

    // Extracting error message from response, fallback to default if not available
    String errorMessage = response.data?['message'] ??
        _getDefaultErrorMessage(response.statusCode);

    switch (response.statusCode) {
      case 200:
      case 201:
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode!,
          responseData: response.data,
          errorMessage: '',
        );
      case 204:
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode!,
          responseData: null,
          errorMessage: '',
        );
      default:
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode!,
          errorMessage: errorMessage,
          responseData: null,
        );
    }
  }

  /// 🔹 Default error message generator
  String _getDefaultErrorMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        AuthService.logoutUser();
        return 'Unauthorized. Please log in.';
      case 403:
        return 'Forbidden. You lack permission.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Unexpected error occurred. Try again.';
    }
  }

  /// 🔹 Error Handling
  ResponseData _handleError(dynamic error) {
    log('Request Error: $error');

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return ResponseData(
            isSuccess: false,
            statusCode: 408,
            errorMessage: 'Request timed out. Check your connection.',
            responseData: null,
          );
        case DioExceptionType.badResponse:
          return ResponseData(
            isSuccess: false,
            statusCode: error.response?.statusCode ?? 500,
            errorMessage: error.response?.data?['message'] ??
                _getDefaultErrorMessage(error.response?.statusCode),
            responseData: null,
          );
        case DioExceptionType.cancel:
          return ResponseData(
            isSuccess: false,
            statusCode: 499,
            errorMessage: 'Request was cancelled.',
            responseData: null,
          );
        case DioExceptionType.connectionError:
          return ResponseData(
            isSuccess: false,
            statusCode: 500,
            errorMessage: 'No internet connection.',
            responseData: null,
          );
        default:
          return ResponseData(
            isSuccess: false,
            statusCode: 500,
            errorMessage: 'Unexpected error occurred. Try again later.',
            responseData: null,
          );
      }
    }

    return ResponseData(
      isSuccess: false,
      statusCode: 500,
      errorMessage: 'Something went wrong. Please try again.',
      responseData: null,
    );
  }
}
