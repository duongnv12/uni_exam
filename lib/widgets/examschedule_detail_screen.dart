import 'package:flutter/cupertino.dart';
import '../models/exam_schedule.dart';

class ExamScheduleDetailScreen extends StatelessWidget {
  final ExamSchedule examSchedule;

  ExamScheduleDetailScreen({required this.examSchedule});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(examSchedule.examScheduleCode),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã lịch thi: ${examSchedule.examScheduleCode}'),
              SizedBox(height: 8.0),
              Text('Mã kỳ thi: ${examSchedule.examId}'),
              SizedBox(height: 8.0),
              Text('Mã phòng học: ${examSchedule.roomId}'),
              SizedBox(height: 8.0),
              Text('Thời gian bắt đầu: ${examSchedule.startTime}'),
              SizedBox(height: 8.0),
              Text('Thời gian kết thúc: ${examSchedule.endTime}'),
            ],
          ),
        ),
      ),
    );
  }
}