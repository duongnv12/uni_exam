import 'package:flutter/cupertino.dart';
import '../models/subject.dart';
import '../services/subject_service.dart';

class AddSubjectScreen extends StatefulWidget {
  @override
  _AddSubjectScreenState createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectService = SubjectService();
  final _subjectCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _creditController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _registeredStudentsController = TextEditingController();
  final _teacherInChargeController = TextEditingController();
  final _specialRequirementsController = TextEditingController();

  void _addSubject() {
    if (_formKey.currentState!.validate()) {
      final subject = Subject(
        id: DateTime.now().toString(), // Generate a unique ID
        subjectCode: _subjectCodeController.text,
        name: _nameController.text,
        credit: int.parse(_creditController.text),
        description: _descriptionController.text,
        registeredStudents: int.parse(_registeredStudentsController.text),
        teacherInCharge: _teacherInChargeController.text,
        specialRequirements: _specialRequirementsController.text,
      );
      _subjectService.createSubject(subject);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm môn học'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã môn học'),
                  controller: _subjectCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã môn học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Tên môn học'),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên môn học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Số tín chỉ'),
                  controller: _creditController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số tín chỉ';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Mô tả'),
                  controller: _descriptionController,
                  maxLines: 3,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Số lượng sinh viên đăng ký'),
                  controller: _registeredStudentsController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số lượng sinh viên đăng ký';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Giáo viên phụ trách'),
                  controller: _teacherInChargeController,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Yêu cầu đặc biệt'),
                  controller: _specialRequirementsController,
                  maxLines: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addSubject,
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