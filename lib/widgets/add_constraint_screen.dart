import 'package:flutter/cupertino.dart';
import '../models/constraint.dart';
import '../services/constraint_service.dart';

class AddConstraintScreen extends StatefulWidget {
  @override
  _AddConstraintScreenState createState() => _AddConstraintScreenState();
}

class _AddConstraintScreenState extends State<AddConstraintScreen> {
  final _formKey = GlobalKey<FormState>();
  final _constraintService = ConstraintService();
  final _constraintCodeController = TextEditingController();
  final _subjectIdController = TextEditingController();
  final _teacherIdController = TextEditingController();
  final _roomIdController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  void _addConstraint() {
    if (_formKey.currentState!.validate()) {
      final constraint = Constraint(
        id: DateTime.now().toString(), // Generate a unique ID
        constraintCode: _constraintCodeController.text,
        subjectId: _subjectIdController.text,
        teacherId: _teacherIdController.text,
        roomId: _roomIdController.text,
        startTime: DateTime.parse(_startTimeController.text),
        endTime: DateTime.parse(_endTimeController.text),
      );
      _constraintService.createConstraint(constraint);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm ràng buộc'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã ràng buộc'),
                  controller: _constraintCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã ràng buộc';
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
                  prefix: Text('Mã giáo viên'),
                  controller: _teacherIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã giáo viên';
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
                    onPressed: _addConstraint,
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