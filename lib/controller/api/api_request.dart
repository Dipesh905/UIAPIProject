import 'package:dio/dio.dart';

class ApiRequest {
  Future<Response<T>?> getRequest<T>(String baseUrl, String endpoint,
      [int? postId]) async {
    Response<T>? response;
    final Dio dio = Dio();

    try {
      response = await dio.get(
          postId == null ? '$baseUrl$endpoint' : '$baseUrl$endpoint/$postId');

      if (response.statusCode == 200) {
        return response;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
      } else if (e.type == DioExceptionType.connectionTimeout) {
      } else if (e.type == DioExceptionType.receiveTimeout) {
      } else if (e.type == DioExceptionType.cancel) {
      } else if (e.type == DioExceptionType.unknown) {}
    } catch (e) {}
    return null;
  }
}
