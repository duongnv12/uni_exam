import '../models/exam_schedule.dart';

class ExamScheduleService {
  List<ExamSchedule> _examSchedules = []; // Danh sách lịch thi (dữ liệu mẫu)

  // Lấy danh sách tất cả lịch thi
  List<ExamSchedule> getAllExamSchedules() {
    return _examSchedules;
  }

  // Lấy thông tin lịch thi theo ID
  ExamSchedule getExamScheduleById(String id) {
    return _examSchedules.firstWhere((examSchedule) => examSchedule.id == id);
  }

  // Tạo mới lịch thi
  void createExamSchedule(ExamSchedule examSchedule) {
    _examSchedules.add(examSchedule);
  }

  // Cập nhật thông tin lịch thi
  void updateExamSchedule(ExamSchedule examSchedule) {
    final index = _examSchedules.indexWhere((e) => e.id == examSchedule.id);
    if (index != -1) {
      _examSchedules[index] = examSchedule;
    }
  }
}