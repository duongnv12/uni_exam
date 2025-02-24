import 'package:flutter/cupertino.dart';
import 'user_screen.dart';
import 'role_screen.dart';
import '../widgets/card_list_tile.dart'; // Import CardListTile

class UserManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Quản lý người dùng'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            CardListTile( // Sử dụng CardListTile
              title: Text('Người dùng'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => UserScreen()),
                );
              },
            ),
            CardListTile( // Sử dụng CardListTile
              title: Text('Vai trò'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => RoleScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}