import '../models/subject.dart';

class SubjectService {
  List<Subject> _subjects = []; // Danh sách môn học (dữ liệu mẫu)

  // Lấy danh sách tất cả môn học
  List<Subject> getAllSubjects() {
    return _subjects;
  }

  // Lấy thông tin môn học theo ID
  Subject getSubjectById(String id) {
    return _subjects.firstWhere((subject) => subject.id == id);
  }

  // Tạo mới môn học
  void createSubject(Subject subject) {
    _subjects.add(subject);
  }

  // Cập nhật thông tin môn học
  void updateSubject(Subject subject) {
    final index = _subjects.indexWhere((s) => s.id == subject.id);
    if (index != -1) {
      _subjects[index] = subject;
    }
  }
}