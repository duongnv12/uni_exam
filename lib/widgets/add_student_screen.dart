import 'package:flutter/cupertino.dart';
import '../models/student.dart';
import '../services/student_service.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _studentService = StudentService();
  final _studentCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _genderController = TextEditingController();
  final _contactInfoController = TextEditingController();
  final _classIdController = TextEditingController();

  void _addStudent() {
    if (_formKey.currentState!.validate()) {
      final student = Student(
        id: DateTime.now().toString(), // Generate a unique ID
        studentCode: _studentCodeController.text,
        name: _nameController.text,
        dateOfBirth: DateTime.parse(_dateOfBirthController.text),
        gender: _genderController.text,
        contactInfo: _contactInfoController.text,
        classId: _classIdController.text,
      );
      _studentService.createStudent(student);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm sinh viên'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã sinh viên'),
                  controller: _studentCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã sinh viên';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Tên sinh viên'),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên sinh viên';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Ngày sinh'),
                  controller: _dateOfBirthController,
                  placeholder: 'YYYY-MM-DD',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập ngày sinh';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Giới tính'),
                  controller: _genderController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập giới tính';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Thông tin liên hệ'),
                  controller: _contactInfoController,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addStudent,
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