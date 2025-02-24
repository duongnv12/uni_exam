import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_role_screen.dart';
import 'package:uni_exam/widgets/role_detail_screen.dart';
import '../services/role_service.dart';
import '../models/role.dart';

class RoleScreen extends StatefulWidget {
  @override
  _RoleScreenState createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  final RoleService _roleService = RoleService();
  List<Role> _roles = [];

  @override
  void initState() {
    super.initState();
    _roles = _roleService.getAllRoles();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Vai trò'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add role screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddRoleScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _roles.length,
          itemBuilder: (context, index) {
            final role = _roles[index];
            return CupertinoListTile(
              title: Text(role.roleName),
              subtitle: Text(role.roleCode),
              onTap: () {
                // TODO: Navigate to role detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => RoleDetailScreen(role: role),
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