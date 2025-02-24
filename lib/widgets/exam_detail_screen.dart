import 'package:flutter/cupertino.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  ExamDetailScreen({required this.exam});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(exam.examCode),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã kỳ thi: ${exam.examCode}'),
              SizedBox(height: 8.0),
              Text('Mã môn học: ${exam.subjectId}'),
              SizedBox(height: 8.0),
              Text('Thời gian bắt đầu: ${exam.startTime}'),
              SizedBox(height: 8.0),
              Text('Thời gian kết thúc: ${exam.endTime}'),
            ],
          ),
        ),
      ),
    );
  }
}