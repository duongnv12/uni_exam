import '../models/teacher.dart';

class TeacherService {
  List<Teacher> _teachers = []; // Danh sách giáo viên (dữ liệu mẫu)

  // Lấy danh sách tất cả giáo viên
  List<Teacher> getAllTeachers() {
    return _teachers;
  }

  // Lấy thông tin giáo viên theo ID
  Teacher getTeacherById(String id) {
    return _teachers.firstWhere((teacher) => teacher.id == id);
  }

  // Tạo mới giáo viên
  void createTeacher(Teacher teacher) {
    _teachers.add(teacher);
  }

  // Cập nhật thông tin giáo viên
  void updateTeacher(Teacher teacher) {
    final index = _teachers.indexWhere((t) => t.id == teacher.id);
    if (index != -1) {
      _teachers[index] = teacher;
    }
  }
}