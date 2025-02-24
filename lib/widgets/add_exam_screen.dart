import 'package:flutter/cupertino.dart';
import '../models/exam.dart';
import '../services/exam_service.dart';

class AddExamScreen extends StatefulWidget {
  @override
  _AddExamScreenState createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  final _formKey = GlobalKey<FormState>();
  final _examService = ExamService();
  final _examCodeController = TextEditingController();
  final _subjectIdController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  void _addExam() {
    if (_formKey.currentState!.validate()) {
      final exam = Exam(
        id: DateTime.now().toString(), // Generate a unique ID
        examCode: _examCodeController.text,
        subjectId: _subjectIdController.text,
        startTime: DateTime.parse(_startTimeController.text),
        endTime: DateTime.parse(_endTimeController.text),
      );
      _examService.createExam(exam);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm kỳ thi'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã kỳ thi'),
                  controller: _examCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã kỳ thi';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã môn học'),
                  controller: _subjectIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã môn học';
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
                    onPressed: _addExam,
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