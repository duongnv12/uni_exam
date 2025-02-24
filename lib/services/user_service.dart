import '../models/user.dart';

class UserService {
  List<User> _users = []; // Danh sách người dùng (dữ liệu mẫu)

  // Lấy danh sách tất cả người dùng
  List<User> getAllUsers() {
    return _users;
  }

  // Lấy thông tin người dùng theo ID
  User getUserById(String id) {
    return _users.firstWhere((user) => user.id == id);
  }

  // Tạo mới người dùng
  void createUser(User user) {
    _users.add(user);
  }

  // Cập nhật thông tin người dùng
  void updateUser(User user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
    }
  }
}