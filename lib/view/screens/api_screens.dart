import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/provider/get_posts_provider.dart';
import 'package:uiapiapp/controller/resources/colors.dart';
import 'package:uiapiapp/controller/resources/images.dart';
import 'package:uiapiapp/model/post/post_model.dart';

class ApiScreen extends ConsumerWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<PostModel>> posts = ref.watch(asyncPostsProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('API Screen'),
        ),
        body: posts.when(
          data: (allposts) {
            return ListView.builder(
                itemCount: allposts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
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
