import 'package:flutter/cupertino.dart';
import 'schedule_screen.dart';
import 'exam_screen.dart';
import 'examschedule_screen.dart';
import 'constraint_screen.dart';
import '../widgets/card_list_tile.dart'; // Import CardListTile

class ScheduleManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Quản lý lịch trình'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            CardListTile( // Sử dụng CardListTile
              title: Text('Lịch học'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ScheduleScreen()),
                );
              },
            ),
            CardListTile( // Sử dụng CardListTile
              title: Text('Kỳ thi'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ExamScreen()),
                );
              },
            ),
            CardListTile( // Sử dụng CardListTile
              title: Text('Lịch thi'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ExamScheduleScreen()),
                );
              },
            ),
            CardListTile( // Sử dụng CardListTile
              title: Text('Ràng buộc'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ConstraintScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}