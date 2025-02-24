import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userService = UserService();
  final _userCodeController = TextEditingController();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _roleIdController = TextEditingController();
  final _passwordController = TextEditingController(); // Thêm controller cho mật khẩu

  void _addUser() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: DateTime.now().toString(),
        userCode: _userCodeController.text,
        email: _emailController.text,
        fullName: _fullNameController.text,
        roleId: _roleIdController.text,
        password: _passwordController.text, // Sử dụng giá trị từ controller
      );
      _userService.createUser(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm người dùng'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã người dùng'),
                  controller: _userCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã người dùng';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Email'),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Họ tên'),
                  controller: _fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập họ tên';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã vai trò'),
                  controller: _roleIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã vai trò';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow( // Thêm trường nhập liệu mật khẩu
                  prefix: Text('Mật khẩu'),
                  controller: _passwordController,
                  obscureText: true, // Ẩn mật khẩu
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addUser,
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