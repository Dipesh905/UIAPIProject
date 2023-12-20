import 'dart:io';

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
      _handleRequestError(e);
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
      _handleRequestError(e);
      await EasyLoading.showError(
        'Something went Wrong',
      );
    }
    return response;
  }

  /// for handling errors
  void _handleRequestError(error) {
    if (error is SocketException) {
      final int? errorCode = error.osError?.errorCode;
      if (errorCode == 61 ||
          errorCode == 60 ||
          errorCode == 111 ||
          errorCode == 101 ||
          errorCode == 104 ||
          errorCode == 51 ||
          errorCode == 8 ||
          errorCode == 113 ||
          errorCode == 7 ||
          errorCode == 64) {
        EasyLoading.showToast(
          'Requesting to Server Failed!',
        );
      }
    }

    throw error as Exception;
  }
}
