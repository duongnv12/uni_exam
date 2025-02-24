import 'package:flutter/cupertino.dart';
import '../models/class.dart';
import '../services/class_service.dart';

class AddClassScreen extends StatefulWidget {
  @override
  _AddClassScreenState createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  final _formKey = GlobalKey<FormState>();
  final _classService = ClassService();
  final _classCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _subjectIdController = TextEditingController();
  final _teacherIdController = TextEditingController();
  final _capacityController = TextEditingController();
  final _studentListController = TextEditingController();

  void _addClass() {
    if (_formKey.currentState!.validate()) {
      final class_ = Class(
        id: DateTime.now().toString(), // Generate a unique ID
        classCode: _classCodeController.text,
        name: _nameController.text,
        subjectId: _subjectIdController.text,
        teacherId: _teacherIdController.text,
        capacity: int.parse(_capacityController.text),
        studentList: _studentListController.text.split(','),
      );
      _classService.createClass(class_);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm lớp học'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã lớp học'),
                  controller: _classCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã lớp học';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Tên lớp học'),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên lớp học';
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
                  prefix: Text('Sức chứa'),
                  controller: _capacityController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập sức chứa';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Danh sách sinh viên'),
                  controller: _studentListController,
                  maxLines: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addClass,
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