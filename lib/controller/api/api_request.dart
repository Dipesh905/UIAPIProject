import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
        await EasyLoading.showError(
          'badResponse',
        );
      } else if (e.type == DioExceptionType.connectionTimeout) {
        await EasyLoading.showError(
          'connectionTimeout',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        await EasyLoading.showError(
          'receiveTimeout',
        );
      } else if (e.type == DioExceptionType.cancel) {
        await EasyLoading.showError(
          'cancel',
        );
      } else if (e.type == DioExceptionType.unknown) {
        await EasyLoading.showError(
          'unknown Error Occured',
        );
      }
    } catch (e) {
      await EasyLoading.showError(
        'Something went Wrong',
      );
    }
    return null;
  }
}
