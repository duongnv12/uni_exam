import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_teacher_screen.dart';
import 'package:uni_exam/widgets/teacher_detail_screen.dart';
import '../services/teacher_service.dart';
import '../models/teacher.dart';

class TeacherScreen extends StatefulWidget {
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  final TeacherService _teacherService = TeacherService();
  List<Teacher> _teachers = [];

  @override
  void initState() {
    super.initState();
    _teachers = _teacherService.getAllTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Giáo viên'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add teacher screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddTeacherScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _teachers.length,
          itemBuilder: (context, index) {
            final teacher = _teachers[index];
            return CupertinoListTile(
              title: Text(teacher.name),
              subtitle: Text(teacher.teacherCode),
              onTap: () {
                // TODO: Navigate to teacher detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => TeacherDetailScreen(teacher: teacher),
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