import 'package:dio/dio.dart';
import 'package:otroja_users/src/core/utils/constant.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 100);
    _dio.options.receiveTimeout = const Duration(seconds: 100);
    
    // Set default headers
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken',
    };
  }

  // GET request
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      print('////////////////////in get');
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      print('after response');
      return response;
    } on DioException catch (e) {
      print("eeeeeeeeeeeeeeeeeeeeeeeeee");
      print(e);
      throw _handleError(e);
    }
  }

  // POST request
  Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response;
    } on DioException catch (e) {
      print(e);
      throw _handleError(e);
    }
  }

  // PUT request
  Future<Response> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
//   Future<String> downloadFile(String url) async {
//   try {
//     Dio dio = Dio();
//     Directory tempDir = await getTemporaryDirectory();
//     String filePath = '${tempDir.path}/document.pdf'; // Change the filename as needed

//     await dio.download(url, filePath);
//     return filePath; // Return the local file path
//   } catch (e) {
//     throw Exception('Error downloading file: $e');
//   }
// }

  

  // Error handling
  Exception _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(e.message ?? 'Connection timeout');
      case DioExceptionType.badResponse:
        return BadResponseException(e.response?.statusCode, e.response?.data);
      case DioExceptionType.cancel:
        return RequestCancelledException(e.message ?? 'Request cancelled');
      default:
        return UnknownException(e.message ?? 'An unknown error occurred');
    }
  }
}

// Custom exceptions
class TimeoutException implements Exception {
  final String message;

  TimeoutException(this.message);
}

class BadResponseException implements Exception {
  final int? statusCode;
  final dynamic data;

  BadResponseException(this.statusCode, this.data);
}

class RequestCancelledException implements Exception {
  final String message;

  RequestCancelledException(this.message);
}

class UnknownException implements Exception {
  final String message;

  UnknownException(this.message);
}