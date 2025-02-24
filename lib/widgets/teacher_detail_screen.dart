import 'package:flutter/cupertino.dart';
import '../models/teacher.dart';

class TeacherDetailScreen extends StatelessWidget {
  final Teacher teacher;

  TeacherDetailScreen({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(teacher.name),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã giáo viên: ${teacher.teacherCode}'),
              SizedBox(height: 8.0),
              Text('Tên giáo viên: ${teacher.name}'),
              SizedBox(height: 8.0),
              Text('Khoa: ${teacher.faculty}'),
              SizedBox(height: 8.0),
              Text('Thông tin liên hệ: ${teacher.contactInfo}'),
              SizedBox(height: 8.0),
              Text('Danh sách môn học: ${teacher.subjectList.join(', ')}'),
              SizedBox(height: 8.0),
              Text('Lịch trình bận: ${teacher.busySchedule.map((range) => '${range.start} - ${range.end}').join(', ')}'),
            ],
          ),
        ),
      ),
    );
  }
}