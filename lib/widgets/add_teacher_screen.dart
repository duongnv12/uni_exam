import 'package:flutter/cupertino.dart';
import '../models/teacher.dart';
import '../services/teacher_service.dart';

class AddTeacherScreen extends StatefulWidget {
  @override
  _AddTeacherScreenState createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  final _formKey = GlobalKey<FormState>();
  final _teacherService = TeacherService();
  final _teacherCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _facultyController = TextEditingController();
  final _contactInfoController = TextEditingController();
  final _subjectListController = TextEditingController();
  final _busyScheduleController = TextEditingController();

  void _addTeacher() {
    if (_formKey.currentState!.validate()) {
      final teacher = Teacher(
        id: DateTime.now().toString(), // Generate a unique ID
        teacherCode: _teacherCodeController.text,
        name: _nameController.text,
        faculty: _facultyController.text,
        contactInfo: _contactInfoController.text,
        subjectList: _subjectListController.text.split(','),
        busySchedule: [], // TODO: Parse busy schedule from controller
      );
      _teacherService.createTeacher(teacher);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm giáo viên'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã giáo viên'),
                  controller: _teacherCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã giáo viên';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Tên giáo viên'),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên giáo viên';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Khoa'),
                  controller: _facultyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập khoa';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Thông tin liên hệ'),
                  controller: _contactInfoController,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Danh sách môn học'),
                  controller: _subjectListController,
                  maxLines: 3,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Lịch trình bận'),
                  controller: _busyScheduleController,
                  maxLines: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addTeacher,
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