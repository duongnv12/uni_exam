import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_schedule_screen.dart';
import 'package:uni_exam/widgets/schedule_detail_screen.dart';
import '../services/schedule_service.dart';
import '../models/schedule.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ScheduleService _scheduleService = ScheduleService();
  List<Schedule> _schedules = [];

  @override
  void initState() {
    super.initState();
    _schedules = _scheduleService.getAllSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Lịch học'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add schedule screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddScheduleScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _schedules.length,
          itemBuilder: (context, index) {
            final schedule = _schedules[index];
            return CupertinoListTile(
              title: Text(schedule.scheduleCode),
              subtitle: Text('Start: ${schedule.startTime}, End: ${schedule.endTime}'),
              onTap: () {
                // TODO: Navigate to schedule detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ScheduleDetailScreen(schedule: schedule),
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