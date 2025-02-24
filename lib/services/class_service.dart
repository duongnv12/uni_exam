import '../models/class.dart';

class ClassService {
  List<Class> _classes = []; // Danh sách lớp học (dữ liệu mẫu)

  // Lấy danh sách tất cả lớp học
  List<Class> getAllClasses() {
    return _classes;
  }

  // Lấy thông tin lớp học theo ID
  Class getClassById(String id) {
    return _classes.firstWhere((class_) => class_.id == id);
  }

  // Tạo mới lớp học
  void createClass(Class class_) {
    _classes.add(class_);
  }

  // Cập nhật thông tin lớp học
  void updateClass(Class class_) {
    final index = _classes.indexWhere((c) => c.id == class_.id);
    if (index != -1) {
      _classes[index] = class_;
    }
  }
}