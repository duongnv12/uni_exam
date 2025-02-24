import '../models/student.dart';

class StudentService {
  List<Student> _students = []; // Danh sách sinh viên (dữ liệu mẫu)

  // Lấy danh sách tất cả sinh viên
  List<Student> getAllStudents() {
    return _students;
  }

  // Lấy thông tin sinh viên theo ID
  Student getStudentById(String id) {
    return _students.firstWhere((student) => student.id == id);
  }

  // Tạo mới sinh viên
  void createStudent(Student student) {
    _students.add(student);
  }

  // Cập nhật thông tin sinh viên
  void updateStudent(Student student) {
    final index = _students.indexWhere((s) => s.id == student.id);
    if (index != -1) {
      _students[index] = student;
    }
  }
}