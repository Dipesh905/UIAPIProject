import 'package:dio/dio.dart';
import 'package:uiapiapp/controller/api/api_request.dart';
import 'package:uiapiapp/controller/resources/api_constants.dart';
import 'package:uiapiapp/model/post/post_model.dart';
import 'package:uiapiapp/model/post/post_model_list.dart';

class ApiFunction {
  ApiRequest apiRequest = ApiRequest();

  Future<List<PostModel>> getPosts() async {
    Response? response = await apiRequest.getRequest(baseUrl, postsEndPoint);

    if (response != null && response.statusCode == 200) {
      return PostModelList.fromJson(response.data).postModelList;
    }
    return [];
  }
}
