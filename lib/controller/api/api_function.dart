import 'package:dio/dio.dart';
import 'package:uiapiapp/controller/api/api_request.dart';
import 'package:uiapiapp/controller/resources/api_constants.dart';
import 'package:uiapiapp/model/post/post_model.dart';
import 'package:uiapiapp/model/post/post_model_list.dart';
import 'package:uiapiapp/model/users/users_list_model.dart';
import 'package:uiapiapp/model/users/users_model.dart';

class ApiFunction {
  ApiRequest apiRequest = ApiRequest();

  Future<List<PostModel>> getPosts() async {
    Response? response = await apiRequest.getRequest(
      baseUrl,
      postsEndPoint,
    );

    if (response != null && response.statusCode == 200) {
      return PostModelList.fromJson(response.data).postModelList;
    }
    return [];
  }

  Future<PostModel?> getSinglePost(int selectedId) async {
    Response? response =
        await apiRequest.getRequest(baseUrl, postsEndPoint, selectedId);

    if (response != null && response.statusCode == 200) {
      return PostModel.fromJson(response.data);
    }
    return null;
  }

  Future<List<User>> getUserss() async {
    Response? response = await apiRequest.getRequest(baseUrl, usersEndPoint);

    if (response != null && response.statusCode == 200) {
      return UserList.fromJson(response.data).userList;
    }
    return [];
  }
}
