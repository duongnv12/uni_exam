import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts
import 'data_management_screen.dart';
import 'schedule_management_screen.dart';
import 'user_management_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            label: 'Dữ liệu',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Lịch trình',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2_square_stack),
            label: 'Người dùng',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return DataManagementScreen();
          case 1:
            return ScheduleManagementScreen();
          case 2:
            return UserManagementScreen();
          default:
            return DataManagementScreen();
        }
      },
    );
  }
}