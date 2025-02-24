import 'package:flutter/cupertino.dart';
import 'package:uni_exam/screens/home_screen.dart';
import 'screens/login_screen.dart'; // Import LoginScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Quản lý lịch học và thi cử',
      home: HomeScreen(), // Sử dụng LoginScreen làm màn hình khởi đầu
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(

        brightness: Brightness.light,
      ),
    );
  }
}