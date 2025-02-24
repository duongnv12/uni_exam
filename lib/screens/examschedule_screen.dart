import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_examschedule_screen.dart';
import 'package:uni_exam/widgets/examschedule_detail_screen.dart';
import '../services/examschedule_service.dart';
import '../models/exam_schedule.dart';

class ExamScheduleScreen extends StatefulWidget {
  @override
  _ExamScheduleScreenState createState() => _ExamScheduleScreenState();
}

class _ExamScheduleScreenState extends State<ExamScheduleScreen> {
  final ExamScheduleService _examScheduleService = ExamScheduleService();
  List<ExamSchedule> _examSchedules = [];

  @override
  void initState() {
    super.initState();
    _examSchedules = _examScheduleService.getAllExamSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Lịch thi'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add exam schedule screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddExamScheduleScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _examSchedules.length,
          itemBuilder: (context, index) {
            final examSchedule = _examSchedules[index];
            return CupertinoListTile(
              title: Text(examSchedule.examScheduleCode),
              subtitle: Text('Start: ${examSchedule.startTime}, End: ${examSchedule.endTime}'),
              onTap: () {
                // TODO: Navigate to exam schedule detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ExamScheduleDetailScreen(examSchedule: examSchedule),
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