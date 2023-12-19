import 'package:uiapiapp/model/post/post_model.dart';

class PostModelList {
  PostModelList({required this.postModelList});

  factory PostModelList.fromJson(List<dynamic> json) => PostModelList(
        postModelList: json
            .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  List<PostModel> postModelList;
}
