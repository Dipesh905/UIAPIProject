import 'package:uiapiapp/model/users/users_model.dart';

class UserList {
  UserList({required this.userList});

  factory UserList.fromJson(List<dynamic> json) => UserList(
        userList:
            json.map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
      );

  List<User> userList;
}
