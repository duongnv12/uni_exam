import 'package:flutter/cupertino.dart';
import '../models/schedule.dart';
import '../services/schedule_service.dart';

class AddScheduleScreen extends StatefulWidget {
  @override
  _AddScheduleScreenState createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scheduleService = ScheduleService();
  final _scheduleCodeController = TextEditingController();
  final _classIdController = TextEditingController();
  final _roomIdController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _academicYearController = TextEditingController();
  final _semesterController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  void _addSchedule() {
    if (_formKey.currentState!.validate()) {
      final schedule = Schedule(
        id: DateTime.now().toString(), // Generate a unique ID
        scheduleCode: _scheduleCodeController.text,
        classId: _classIdController.text,
        roomId: _roomIdController.text,
        startTime: DateTime.parse(_startTimeController.text),
        endTime: DateTime.parse(_endTimeController.text),
        academicYear: _academicYearController.text,
        semester: _semesterController.text,
        startDate: DateTime.parse(_startDateController.text),
        endDate: DateTime.parse(_endDateController.text),
      );
      _scheduleService.createSchedule(schedule);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm lịch học'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã lịch học'),
                  controller: _scheduleCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã lịch học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã lớp học'),
                  controller: _classIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã lớp học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã phòng học'),
                  controller: _roomIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã phòng học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Thời gian bắt đầu'),
                  controller: _startTimeController,
                  placeholder: 'YYYY-MM-DD HH:MM:SS',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập thời gian bắt đầu';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Thời gian kết thúc'),
                  controller: _endTimeController,
                  placeholder: 'YYYY-MM-DD HH:MM:SS',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập thời gian kết thúc';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Năm học'),
                  controller: _academicYearController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập năm học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Học kỳ'),
                  controller: _semesterController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập học kỳ';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Ngày bắt đầu'),
                  controller: _startDateController,
                  placeholder: 'YYYY-MM-DD',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập ngày bắt đầu';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Ngày kết thúc'),
                  controller: _endDateController,
                  placeholder: 'YYYY-MM-DD',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập ngày kết thúc';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addSchedule,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}