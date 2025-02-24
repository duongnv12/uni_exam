import 'package:flutter/cupertino.dart';
import '../models/subject.dart';

class SubjectDetailScreen extends StatelessWidget {
  final Subject subject;

  SubjectDetailScreen({required this.subject});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(subject.name),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã môn học: ${subject.subjectCode}'),
              SizedBox(height: 8.0),
              Text('Tên môn học: ${subject.name}'),
              SizedBox(height: 8.0),
              Text('Số tín chỉ: ${subject.credit}'),
              SizedBox(height: 8.0),
              Text('Mô tả: ${subject.description}'),
              SizedBox(height: 8.0),
              Text('Số lượng sinh viên đăng ký: ${subject.registeredStudents}'),
              SizedBox(height: 8.0),
              Text('Giáo viên phụ trách: ${subject.teacherInCharge}'),
              SizedBox(height: 8.0),
              Text('Yêu cầu đặc biệt: ${subject.specialRequirements}'),
            ],
          ),
        ),
      ),
    );
  }
}