import 'package:flutter/cupertino.dart';
import '../models/role.dart';

class RoleDetailScreen extends StatelessWidget {
  final Role role;

  RoleDetailScreen({required this.role});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(role.roleName),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã vai trò: ${role.roleCode}'),
              SizedBox(height: 8.0),
              Text('Tên vai trò: ${role.roleName}'),
            ],
          ),
        ),
      ),
    );
  }
}