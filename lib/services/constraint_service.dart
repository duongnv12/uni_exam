import '../models/constraint.dart';

class ConstraintService {
  List<Constraint> _constraints = []; // Danh sách ràng buộc (dữ liệu mẫu)

  // Lấy danh sách tất cả ràng buộc
  List<Constraint> getAllConstraints() {
    return _constraints;
  }

  // Lấy thông tin ràng buộc theo ID
  Constraint getConstraintById(String id) {
    return _constraints.firstWhere((constraint) => constraint.id == id);
  }

  // Tạo mới ràng buộc
  void createConstraint(Constraint constraint) {
    _constraints.add(constraint);
  }

  // Cập nhật thông tin ràng buộc
  void updateConstraint(Constraint constraint) {
    final index = _constraints.indexWhere((c) => c.id == constraint.id);
    if (index != -1) {
      _constraints[index] = constraint;
    }
  }
}