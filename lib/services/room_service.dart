import '../models/room.dart';

class RoomService {
  List<Room> _rooms = []; // Danh sách phòng học (dữ liệu mẫu)

  // Lấy danh sách tất cả phòng học
  List<Room> getAllRooms() {
    return _rooms;
  }

  // Lấy thông tin phòng học theo ID
  Room getRoomById(String id) {
    return _rooms.firstWhere((room) => room.id == id);
  }

  // Tạo mới phòng học
  void createRoom(Room room) {
    _rooms.add(room);
  }

  // Cập nhật thông tin phòng học
  void updateRoom(Room room) {
    final index = _rooms.indexWhere((r) => r.id == room.id);
    if (index != -1) {
      _rooms[index] = room;
    }
  }
}