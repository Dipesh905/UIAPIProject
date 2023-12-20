import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/provider/get_posts_provider.dart';
import 'package:uiapiapp/controller/provider/get_single_post_provider.dart';
import 'package:uiapiapp/controller/provider/get_users_provider.dart';
import 'package:uiapiapp/controller/provider/userdetail_postdetails_provider.dart';
import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/controller/resources/images.dart';
import 'package:uiapiapp/model/users/users_model.dart';
import 'package:uiapiapp/view/screens/select_user_detail_screen.dart';

class NewApiScreen extends StatelessWidget {
  const NewApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              ref.read(asyncPostsProvider.notifier).refetchPosts();
            },
            child: const Icon(Icons.refresh),
          );
        },
      ),
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
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return Consumer(
                              builder: (context, ref, child) {
                                final asyncUsers =
                                    ref.watch(asyncUsersProvider);

                                return asyncUsers.when(
                                  data: (users) {
                                    User userWithSameUserIdInPost =
                                        users.firstWhere(
                                      (element) =>
                                          element.id == posts[index].userId,
                                    );

                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (userWithSameUserIdInPost != null) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectedUserDetailScreen(
                                              user: userWithSameUserIdInPost,
                                            ),
                                          ),
                                        );
                                      }
                                    });

                                    return const SizedBox();
                                  },
                                  error: (error, stackTrace) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: Text(
                                          'Error obtaining the data: $error'),
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
                      child: posts.isNotEmpty
                          ? Container(
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
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final userDetailPostDetailStatus =
                                          ref.watch(
                                              userDetailPostDetailStatusProvider);
                                      return PopupMenuButton<
                                          UserDetailPostDetailStatus>(
                                        icon: SizedBox(
                                            height: 20,
                                            width: 40,
                                            child: Image.asset(
                                              AppImage.threeDotImage,
                                              fit: BoxFit.cover,
                                            )),
                                        initialValue:
                                            userDetailPostDetailStatus,
                                        onSelected:
                                            (UserDetailPostDetailStatus item) {
                                          ref
                                              .read(
                                                  userDetailPostDetailStatusProvider
                                                      .notifier)
                                              .update((state) => item);

                                          if (item ==
                                              UserDetailPostDetailStatus
                                                  .postDetails) {
                                            showBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Consumer(
                                                  builder:
                                                      (context, ref, child) {
                                                    final response = ref.watch(
                                                        singlePostProvider(
                                                            posts[index].id));

                                                    return response.when(
                                                      data: (post) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                  'Currently Selected Post Detail'),
                                                              Text(
                                                                  'Id: ${post?.id}'),
                                                              Text(
                                                                  'Title: ${post?.title}'),
                                                              Text(
                                                                  'Body: ${post?.body}'),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      error: (error,
                                                              stackTrace) =>
                                                          const Text(
                                                              'Error Obtaining data'),
                                                      loading: () =>
                                                          const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          } else if (item ==
                                              UserDetailPostDetailStatus
                                                  .userDetails) {
                                            showBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Consumer(
                                                  builder:
                                                      (context, ref, child) {
                                                    final asyncUsers =
                                                        ref.watch(
                                                            asyncUsersProvider);

                                                    return asyncUsers.when(
                                                      data: (users) {
                                                        User
                                                            userWithSameUserIdInPost =
                                                            users
                                                                .where(
                                                                  (element) =>
                                                                      element
                                                                          .id ==
                                                                      posts[index]
                                                                          .userId,
                                                                )
                                                                .first;

                                                        return SingleChildScrollView(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    'Personal Information'),
                                                                Text(
                                                                    'Id: ${userWithSameUserIdInPost.id}'),
                                                                Text(
                                                                    'Name: ${userWithSameUserIdInPost.name}'),
                                                                Text(
                                                                    'UserName: ${userWithSameUserIdInPost.username}'),
                                                                const Text(
                                                                    'Personal Information'),
                                                                Text(
                                                                    'Email: ${userWithSameUserIdInPost.email}'),
                                                                Text(
                                                                    'phone: ${userWithSameUserIdInPost.phone}'),
                                                                Text(
                                                                    'website: ${userWithSameUserIdInPost.website}'),
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 8.0),
                                                                  child: Text(
                                                                      'Address'),
                                                                ),
                                                                Text(
                                                                    'Street: ${userWithSameUserIdInPost.address.street}'),
                                                                Text(
                                                                    'suite: ${userWithSameUserIdInPost.address.suite}'),
                                                                Text(
                                                                    'city: ${userWithSameUserIdInPost.address.city}'),
                                                                Text(
                                                                    'zipcode: ${userWithSameUserIdInPost.address.zipcode}'),
                                                                Text(
                                                                    'lat: ${userWithSameUserIdInPost.address.geo.lat}'),
                                                                Text(
                                                                    'lng: ${userWithSameUserIdInPost.address.geo.lng}'),
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 8.0),
                                                                  child: Text(
                                                                      'Company Details'),
                                                                ),
                                                                Text(
                                                                    'name: ${userWithSameUserIdInPost.company.name}'),
                                                                Text(
                                                                    'catchPhrase: ${userWithSameUserIdInPost.company.catchPhrase}'),
                                                                Text(
                                                                    'bs: ${userWithSameUserIdInPost.company.bs}'),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      error:
                                                          (error, stackTrace) {
                                                        return const Text(
                                                            'Error Obtaining the data');
                                                      },
                                                      loading: () {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        },
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<
                                                UserDetailPostDetailStatus>>[
                                          const PopupMenuItem<
                                              UserDetailPostDetailStatus>(
                                            value: UserDetailPostDetailStatus
                                                .postDetails,
                                            child: Text('Post Details'),
                                          ),
                                          const PopupMenuItem<
                                              UserDetailPostDetailStatus>(
                                            value: UserDetailPostDetailStatus
                                                .userDetails,
                                            child: Text('User Details'),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                          : const Center(
                              child: Text('No Data Found'),
                            ));
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
