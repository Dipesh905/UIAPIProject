import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UserDetailPostDetailStatus {
  userDetails,

  postDetails
}

final StateProvider<UserDetailPostDetailStatus?>
    userDetailPostDetailStatusProvider =
    StateProvider<UserDetailPostDetailStatus?>(
        (StateProviderRef<UserDetailPostDetailStatus?> ref) {
  return null;
});
