import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/provider/get_posts_provider.dart';
import 'package:uiapiapp/controller/provider/get_users_provider.dart';
import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/controller/resources/images.dart';
import 'package:uiapiapp/model/post/post_model.dart';
import 'package:uiapiapp/view/screens/select_user_detail_screen.dart';

class ApiScreen extends ConsumerWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<PostModel>> posts = ref.watch(asyncPostsProvider);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(asyncPostsProvider.notifier).refetchPosts();
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text('API Screen'),
        ),
        body: posts.when(
          data: (allposts) {
            return ListView.builder(
                itemCount: allposts.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // TODO: Logic check plus ramro sanga milauna baki
                      int selectedPostUserId = allposts[index].userId;
                      print(selectedPostUserId);
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Consumer(
                            builder: (context, ref, child) {
                              final usersProvider =
                                  ref.watch(asyncUsersProvider);

                              return AlertDialog(
                                content: usersProvider.when(
                                  data: (users) {
                                    for (int i = 0; i < users.length; i++) {
                                      print(users[i].id);

                                      if (users[i].id == selectedPostUserId) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectedUserDetailScreen(
                                                user: users[users[i].id],
                                              ),
                                            ));
                                      }
                                    }

                                    return const SizedBox();
                                  },
                                  error: (error, stackTrace) =>
                                      const Text('Error Obtaining Data'),
                                  loading: () =>
                                      const CircularProgressIndicator(),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColor.lightGreyColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              child: Text(allposts[index].userId.toString())),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                allposts[index].title,
                              ),
                            ),
                          ),
                          InkWell(
                            child: SizedBox(
                              height: 30,
                              width: 40,
                              child: Image.asset(
                                AppImage.threeDotImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          error: (error, stackTrace) {
            return const Text('Error Occured');
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
