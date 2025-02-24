import '../models/schedule.dart';

class ScheduleService {
  List<Schedule> _schedules = []; // Danh sách lịch học (dữ liệu mẫu)

  // Lấy danh sách tất cả lịch học
  List<Schedule> getAllSchedules() {
    return _schedules;
  }

  // Lấy thông tin lịch học theo ID
  Schedule getScheduleById(String id) {
    return _schedules.firstWhere((schedule) => schedule.id == id);
  }

  // Tạo mới lịch học
  void createSchedule(Schedule schedule) {
    _schedules.add(schedule);
  }

  // Cập nhật thông tin lịch học
  void updateSchedule(Schedule schedule) {
    final index = _schedules.indexWhere((s) => s.id == schedule.id);
    if (index != -1) {
      _schedules[index] = schedule;
    }
  }
}