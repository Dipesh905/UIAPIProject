import 'package:dio/dio.dart';

class ApiRequest {
  Future<Response<T>?> getRequest<T>(
    String baseUrl,
    String endpoint,
  ) async {
    Response<T>? response;
    final Dio dio = Dio();

    try {
      response = await dio.get(
        baseUrl + endpoint,
      );

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
