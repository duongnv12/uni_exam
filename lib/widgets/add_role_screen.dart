import 'package:flutter/cupertino.dart';
import '../models/role.dart';
import '../services/role_service.dart';

class AddRoleScreen extends StatefulWidget {
  @override
  _AddRoleScreenState createState() => _AddRoleScreenState();
}

class _AddRoleScreenState extends State<AddRoleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _roleService = RoleService();
  final _roleCodeController = TextEditingController();
  final _roleNameController = TextEditingController();

  void _addRole() {
    if (_formKey.currentState!.validate()) {
      final role = Role(
        id: DateTime.now().toString(), // Generate a unique ID
        roleCode: _roleCodeController.text,
        roleName: _roleNameController.text,
      );
      _roleService.createRole(role);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm vai trò'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã vai trò'),
                  controller: _roleCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã vai trò';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Tên vai trò'),
                  controller: _roleNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên vai trò';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addRole,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}