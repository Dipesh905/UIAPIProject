import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiapiapp/controller/api/api_function.dart';
import 'package:uiapiapp/model/users/users_model.dart';

class AsyncUsersNotifier extends AsyncNotifier<List<User>> {
  final ApiFunction _apiFunction = ApiFunction();

  Future<List<User>> _fetchUsers() async => _apiFunction.getUserss();

  @override
  Future<List<User>> build() async {
    return _fetchUsers();
  }
}

final asyncUsersProvider =
    AsyncNotifierProvider<AsyncUsersNotifier, List<User>>(() {
  return AsyncUsersNotifier();
});

final usersProvider = Provider((ref) {
  final users = ref.watch(asyncUsersProvider);

  users.when(
    data: (data) {
      return data;
    },
    error: (error, stackTrace) => [],
    loading: () => [],
  );
});
