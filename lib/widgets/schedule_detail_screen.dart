import 'package:flutter/cupertino.dart';
import '../models/schedule.dart';

class ScheduleDetailScreen extends StatelessWidget {
  final Schedule schedule;

  ScheduleDetailScreen({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(schedule.scheduleCode),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã lịch học: ${schedule.scheduleCode}'),
              SizedBox(height: 8.0),
              Text('Mã lớp học: ${schedule.classId}'),
              SizedBox(height: 8.0),
              Text('Mã phòng học: ${schedule.roomId}'),
              SizedBox(height: 8.0),
              Text('Thời gian bắt đầu: ${schedule.startTime}'),
              SizedBox(height: 8.0),
              Text('Thời gian kết thúc: ${schedule.endTime}'),
              SizedBox(height: 8.0),
              Text('Năm học: ${schedule.academicYear}'),
              SizedBox(height: 8.0),
              Text('Học kỳ: ${schedule.semester}'),
              SizedBox(height: 8.0),
              Text('Ngày bắt đầu: ${schedule.startDate}'),
              SizedBox(height: 8.0),
              Text('Ngày kết thúc: ${schedule.endDate}'),
            ],
          ),
        ),
      ),
    );
  }
}