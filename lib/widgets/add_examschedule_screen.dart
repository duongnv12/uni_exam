import 'package:flutter/cupertino.dart';
import '../models/exam_schedule.dart';
import '../services/examschedule_service.dart';

class AddExamScheduleScreen extends StatefulWidget {
  @override
  _AddExamScheduleScreenState createState() => _AddExamScheduleScreenState();
}

class _AddExamScheduleScreenState extends State<AddExamScheduleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _examScheduleService = ExamScheduleService();
  final _examScheduleCodeController = TextEditingController();
  final _examIdController = TextEditingController();
  final _roomIdController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  void _addExamSchedule() {
    if (_formKey.currentState!.validate()) {
      final examSchedule = ExamSchedule(
        id: DateTime.now().toString(), // Generate a unique ID
        examScheduleCode: _examScheduleCodeController.text,
        examId: _examIdController.text,
        roomId: _roomIdController.text,
        startTime: DateTime.parse(_startTimeController.text),
        endTime: DateTime.parse(_endTimeController.text),
      );
      _examScheduleService.createExamSchedule(examSchedule);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm lịch thi'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã lịch thi'),
                  controller: _examScheduleCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã lịch thi';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã kỳ thi'),
                  controller: _examIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã kỳ thi';
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addExamSchedule,
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