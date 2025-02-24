import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_user_screen.dart';
import 'package:uni_exam/widgets/user_detail_screen.dart';
import '../services/user_service.dart';
import '../models/user.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserService _userService = UserService();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _users = _userService.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Người dùng'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add user screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddUserScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            final user = _users[index];
            return CupertinoListTile(
              title: Text(user.fullName),
              subtitle: Text(user.email),
              onTap: () {
                // TODO: Navigate to user detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => UserDetailScreen(user: user),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}