import 'package:flutter/cupertino.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(user.fullName),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã người dùng: ${user.userCode}'),
              SizedBox(height: 8.0),
              Text('Email: ${user.email}'),
              SizedBox(height: 8.0),
              Text('Họ tên: ${user.fullName}'),
              SizedBox(height: 8.0),
              Text('Mã vai trò: ${user.roleId}'),
            ],
          ),
        ),
      ),
    );
  }
}