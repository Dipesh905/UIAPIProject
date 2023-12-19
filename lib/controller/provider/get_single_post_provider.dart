import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/api/api_function.dart';
import 'package:uiapiapp/model/post/post_model.dart';

final singlePostProvider =
    FutureProvider.family<PostModel?, int>((ref, int selectedId) async {
  final ApiFunction apiFunction = ApiFunction();

  return apiFunction.getSinglePost(selectedId);
});
