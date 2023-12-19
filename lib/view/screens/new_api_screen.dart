import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/provider/get_posts_provider.dart';
import 'package:uiapiapp/controller/provider/get_users_provider.dart';
import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/controller/resources/images.dart';
import 'package:uiapiapp/model/users/users_model.dart';
import 'package:uiapiapp/view/screens/select_user_detail_screen.dart';

class NewApiScreen extends StatelessWidget {
  const NewApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Api Screen'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final asyncPosts = ref.watch(asyncPostsProvider);

          return asyncPosts.when(
            data: (posts) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      print(
                          '=====Selected User Id===== ${posts[index].userId}  =================');

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (ctx) {
                          return Consumer(
                            builder: (context, ref, child) {
                              final asyncUsers = ref.watch(asyncUsersProvider);

                              return asyncUsers.when(
                                data: (users) {
                                  User userWithSameUserIdInPost = users
                                      .where(
                                        (element) =>
                                            element.id == posts[index].userId,
                                      )
                                      .first;

                                  Navigator.push(
                                      ctx,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedUserDetailScreen(
                                                user: userWithSameUserIdInPost),
                                      ));

                                  return AlertDialog(
                                    content:
                                        Center(child: Text(users.toString())),
                                  );
                                },
                                error: (error, stackTrace) {
                                  return const AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Error Obtaining the data'),
                                  );
                                },
                                loading: () {
                                  return const AlertDialog(
                                    content: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.lightGreyColor),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(posts[index].userId.toString()),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(posts[index].title),
                          )),

                          /// pop up menu button implement garne
                          InkWell(
                            child: SizedBox(
                              height: 30,
                              width: 40,
                              child: Image.asset(AppImage.threeDotImage),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return const Center(
                child: Text('Error Obtaining Data'),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
