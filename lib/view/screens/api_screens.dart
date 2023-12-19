// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:uiapiapp/controller/provider/get_posts_provider.dart';
// import 'package:uiapiapp/controller/provider/get_single_post_provider.dart';
// import 'package:uiapiapp/controller/provider/get_users_provider.dart';
// import 'package:uiapiapp/controller/provider/userdetail_postdetails_provider.dart';
// import 'package:uiapiapp/controller/resources/colors.dart';
// import 'package:uiapiapp/controller/resources/images.dart';
// import 'package:uiapiapp/model/post/post_model.dart';
// import 'package:uiapiapp/view/screens/select_user_detail_screen.dart';

// class ApiScreen extends ConsumerWidget {
//   const ApiScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<List<PostModel>> posts = ref.watch(asyncPostsProvider);

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(asyncPostsProvider.notifier).refetchPosts();
//         },
//         child: const Icon(Icons.refresh),
//       ),
//       appBar: AppBar(
//         title: const Text('API Screen'),
//       ),
//       body: posts.when(
//         data: (allposts) {
//           return ListView.builder(
//             itemCount: allposts.length,
//             itemBuilder: (BuildContext context, int index) {
//               Consumer(
//                 builder: (context, ref, child) {
//                   return InkWell(
//                     onTap: () {
//                       ref.listen(asyncPostsProvider, (a, b) {});
//                       // final userDetailPostDetailStatus =
//                       //     ref.watch(userDetailPostDetailStatusProvider);

//                       // ref.listen(userDetailPostDetailStatusProvider,
//                       //     (previous, next) {
//                       //   print(
//                       //       '=======Previous======= $previous  ===================');
//                       //   print('===Next==== $next =============');
//                       //   if (next == UserDetailPostDetailStatus.postDetails) {
//                       //     final response =
//                       //         ref.watch(singlePostProvider(allposts[index].id));
//                       //     showBottomSheet(
//                       //       context: context,
//                       //       builder: (context) {
//                       //         return response.when(
//                       //           data: (post) {
//                       //             return Padding(
//                       //               padding: const EdgeInsets.all(8.0),
//                       //               child: Column(
//                       //                 crossAxisAlignment: CrossAxisAlignment.start,
//                       //                 children: [
//                       //                   const Text(
//                       //                       'Currently Selected Post Detail'),
//                       //                   Text('Id: ${post?.id}'),
//                       //                   Text('Title: ${post?.title}'),
//                       //                   Text('Body: ${post?.body}'),
//                       //                 ],
//                       //               ),
//                       //             );
//                       //           },
//                       //           error: (error, stackTrace) =>
//                       //               const Text('Error Obtaining data'),
//                       //           loading: () => const Center(
//                       //             child: CircularProgressIndicator(),
//                       //           ),
//                       //         );
//                       //       },
//                       //     );
//                       //   }
//                       // });
//                       print(
//                           '=======selected post Id ====${allposts[index].id}====================');
//                       // TODO: Logic check plus ramro sanga milauna baki
//                       int selectedPostUserId = allposts[index].userId;
//                       print(
//                           '======Selected Post User Id============ $selectedPostUserId  ===============');
//                       showDialog(
//                         barrierDismissible: false,
//                         context: context,
//                         builder: (context) {
//                           return Consumer(
//                             builder: (context, ref, child) {
//                               final usersProvider =
//                                   ref.watch(asyncUsersProvider);

//                               return AlertDialog(
//                                 content: usersProvider.when(
//                                   data: (users) {
//                                     users.map((e) {
//                                       if (e.id == selectedPostUserId) {
//                                         print(e);
//                                         print(e.id);
//                                         print(selectedPostUserId);
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   SelectedUserDetailScreen(
//                                                 user: e,
//                                               ),
//                                             ));
//                                       }
//                                       return e.id == selectedPostUserId;
//                                     });

//                                     // for (int i = 0; i < users.length; i++) {
//                                     //   print(users[i].id);

//                                     //   if (users[i].id == selectedPostUserId) {
//                                     //     Navigator.push(
//                                     //         context,
//                                     //         MaterialPageRoute(
//                                     //           builder: (context) =>
//                                     //               SelectedUserDetailScreen(
//                                     //             user: users[users[i].id],
//                                     //           ),
//                                     //         ));
//                                     //   }
//                                     // }

//                                     return const SizedBox();
//                                   },
//                                   error: (error, stackTrace) =>
//                                       const Text('Error Obtaining Data'),
//                                   loading: () =>
//                                       const CircularProgressIndicator(),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.all(8),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                           color: AppColor.lightGreyColor,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CircleAvatar(
//                               child: Text(allposts[index].userId.toString())),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     allposts[index].title,
//                                   ),
//                                   Text(
//                                     allposts[index].id.toString(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           PopupMenuButton<UserDetailPostDetailStatus>(
//                             icon: SizedBox(
//                                 height: 20,
//                                 width: 40,
//                                 child: Image.asset(
//                                   AppImage.threeDotImage,
//                                   fit: BoxFit.cover,
//                                 )),
//                             initialValue:
//                                 ref.watch(userDetailPostDetailStatusProvider),
//                             onSelected: (UserDetailPostDetailStatus item) {
//                               ref
//                                   .read(userDetailPostDetailStatusProvider
//                                       .notifier)
//                                   .update((state) => item);

//                               // if (userDetailPostDetailStatus ==
//                               //     UserDetailPostDetailStatus.postDetails) {
//                               // showBottomSheet(
//                               //   context: context,
//                               //   builder: (context) {
//                               //     final response = ref.watch(
//                               //         singlePostProvider(allposts[index].id));

//                               //     return response.when(
//                               //       data: (post) {
//                               //         return Column(
//                               //           children: [
//                               //             const Text(
//                               //                 'Currently Selected Post Detail'),
//                               //             Text('Id: ${post?.id}'),
//                               //             Text('Title: ${post?.title}'),
//                               //             Text('Body: ${post?.body}'),
//                               //           ],
//                               //         );
//                               //       },
//                               //       error: (error, stackTrace) =>
//                               //           const Text('Error Obtaining data'),
//                               //       loading: () => const Center(
//                               //         child: CircularProgressIndicator(),
//                               //       ),
//                               //     );
//                               //   },
//                               // );
//                               // } else if (userDetailPostDetailStatus ==
//                               //     UserDetailPostDetailStatus.userDetails) {
//                               //   showBottomSheet(
//                               //     context: context,
//                               //     builder: (context) {
//                               //       return const Text(
//                               //           'users data in bottomsheet');
//                               //     },
//                               //   );
//                               // }
//                             },
//                             itemBuilder: (BuildContext context) =>
//                                 <PopupMenuEntry<UserDetailPostDetailStatus>>[
//                               const PopupMenuItem<UserDetailPostDetailStatus>(
//                                 value: UserDetailPostDetailStatus.postDetails,
//                                 child: Text('Post Details'),
//                               ),
//                               const PopupMenuItem<UserDetailPostDetailStatus>(
//                                 value: UserDetailPostDetailStatus.userDetails,
//                                 child: Text('User Details'),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//         error: (error, stackTrace) {
//           return const Text('Error Occured');
//         },
//         loading: () => const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
