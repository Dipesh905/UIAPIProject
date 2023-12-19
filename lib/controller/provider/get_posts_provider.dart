import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/api/api_function.dart';
import 'package:uiapiapp/model/post/post_model.dart';

class AsyncPostsNotifier extends AsyncNotifier<List<PostModel>> {
  final ApiFunction _apiFunction = ApiFunction();

  Future<List<PostModel>> _fetchposts() async => _apiFunction.getPosts();

  Future<void> refetchPosts() async {
    state = const AsyncValue<List<PostModel>>.loading();

    state = await AsyncValue.guard(() async {
      await _apiFunction.getPosts();

      return _fetchposts();
    });
  }

  @override
  Future<List<PostModel>> build() async {
    return _fetchposts();
  }
}

final asyncPostsProvider =
    AsyncNotifierProvider<AsyncPostsNotifier, List<PostModel>>(() {
  return AsyncPostsNotifier();
});
