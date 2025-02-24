import 'package:flutter/cupertino.dart';
import '../models/class.dart';

class ClassDetailScreen extends StatelessWidget {
  final Class class_;

  ClassDetailScreen({required this.class_});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(class_.name),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã lớp học: ${class_.classCode}'),
              SizedBox(height: 8.0),
              Text('Tên lớp học: ${class_.name}'),
              SizedBox(height: 8.0),
              Text('Mã môn học: ${class_.subjectId}'),
              SizedBox(height: 8.0),
              Text('Mã giáo viên: ${class_.teacherId}'),
              SizedBox(height: 8.0),
              Text('Sức chứa: ${class_.capacity}'),
              SizedBox(height: 8.0),
              Text('Danh sách sinh viên: ${class_.studentList.join(', ')}'),
            ],
          ),
        ),
      ),
    );
  }
}