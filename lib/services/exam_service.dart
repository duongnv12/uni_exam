import '../models/exam.dart';

class ExamService {
  List<Exam> _exams = []; // Danh sách kỳ thi (dữ liệu mẫu)

  // Lấy danh sách tất cả kỳ thi
  List<Exam> getAllExams() {
    return _exams;
  }

  // Lấy thông tin kỳ thi theo ID
  Exam getExamById(String id) {
    return _exams.firstWhere((exam) => exam.id == id);
  }

  // Tạo mới kỳ thi
  void createExam(Exam exam) {
    _exams.add(exam);
  }

  // Cập nhật thông tin kỳ thi
  void updateExam(Exam exam) {
    final index = _exams.indexWhere((e) => e.id == exam.id);
    if (index != -1) {
      _exams[index] = exam;
    }
  }
}