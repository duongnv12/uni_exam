import 'package:flutter/cupertino.dart';
import '../services/user_service.dart';
import '../models/user.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserService _userService = UserService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // TODO: Implement login logic
    // For example:
    // final user = _userService.getUserByEmail(email);
    // if (user != null && user.password == password) {
    //   Navigator.pushReplacement(
    //     context,
    //     CupertinoPageRoute(builder: (context) => HomeScreen()),
    //   );
    // } else {
    //   // Show error message
    // }

    // Placeholder: Navigate to HomeScreen for now
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Đăng nhập'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                padding: EdgeInsets.all(12.0),
              ),
              SizedBox(height: 16.0),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Mật khẩu',
                obscureText: true,
                padding: EdgeInsets.all(12.0),
              ),
              SizedBox(height: 24.0),
              CupertinoButton.filled(
                child: Text('Đăng nhập'),
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}