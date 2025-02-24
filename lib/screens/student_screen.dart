import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_student_screen.dart';
import 'package:uni_exam/widgets/student_detail_screen.dart';
import '../services/student_service.dart';
import '../models/student.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final StudentService _studentService = StudentService();
  List<Student> _students = [];

  @override
  void initState() {
    super.initState();
    _students = _studentService.getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sinh viên'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add student screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddStudentScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _students.length,
          itemBuilder: (context, index) {
            final student = _students[index];
            return CupertinoListTile(
              title: Text(student.name),
              subtitle: Text(student.studentCode),
              onTap: () {
                // TODO: Navigate to student detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => StudentDetailScreen(student: student),
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