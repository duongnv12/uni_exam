import 'package:flutter/cupertino.dart';
import '../models/student.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;

  StudentDetailScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(student.name),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã sinh viên: ${student.studentCode}'),
              SizedBox(height: 8.0),
              Text('Tên sinh viên: ${student.name}'),
              SizedBox(height: 8.0),
              Text('Ngày sinh: ${student.dateOfBirth}'),
              SizedBox(height: 8.0),
              Text('Giới tính: ${student.gender}'),
              SizedBox(height: 8.0),
              Text('Thông tin liên hệ: ${student.contactInfo}'),
              SizedBox(height: 8.0),
              Text('Mã lớp học: ${student.classId}'),
            ],
          ),
        ),
      ),
    );
  }
}