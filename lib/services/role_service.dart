import '../models/role.dart';

class RoleService {
  List<Role> _roles = []; // Danh sách vai trò (dữ liệu mẫu)

  // Lấy danh sách tất cả vai trò
  List<Role> getAllRoles() {
    return _roles;
  }

  // Lấy thông tin vai trò theo ID
  Role getRoleById(String id) {
    return _roles.firstWhere((role) => role.id == id);
  }

  // Tạo mới vai trò
  void createRole(Role role) {
    _roles.add(role);
  }

  // Cập nhật thông tin vai trò
  void updateRole(Role role) {
    final index = _roles.indexWhere((r) => r.id == role.id);
    if (index != -1) {
      _roles[index] = role;
    }
  }
}