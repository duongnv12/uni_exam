import 'package:flutter/cupertino.dart';
import 'subject_screen.dart';
import 'class_screen.dart';
import 'teacher_screen.dart';
import 'room_screen.dart';
import 'student_screen.dart';
import '../widgets/card_list_tile.dart';

class DataManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Quản lý dữ liệu'),
      ),
      child: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(fontFamily: 'Poppins'),
          child: ListView(
            children: [
              CardListTile(
                title: Text('Môn học'),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SubjectScreen()),
                  );
                },
              ),
              CardListTile(
                title: Text('Lớp học'),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => ClassScreen()),
                  );
                },
              ),
              CardListTile(
                title: Text('Giáo viên'),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => TeacherScreen()),
                  );
                },
              ),
              CardListTile(
                title: Text('Phòng học'),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => RoomScreen()),
                  );
                },
              ),
              CardListTile(
                title: Text('Sinh viên'),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => StudentScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}