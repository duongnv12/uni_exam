import '../models/report.dart';

class ReportService {
  List<Report> _reports = []; // Danh sách báo cáo (dữ liệu mẫu)

  // Lấy danh sách tất cả báo cáo
  List<Report> getAllReports() {
    return _reports;
  }

  // Lấy thông tin báo cáo theo ID
  Report getReportById(String id) {
    return _reports.firstWhere((report) => report.id == id);
  }

  // Tạo mới báo cáo
  void createReport(Report report) {
    _reports.add(report);
  }

  // Cập nhật thông tin báo cáo
  void updateReport(Report report) {
    final index = _reports.indexWhere((r) => r.id == report.id);
    if (index != -1) {
      _reports[index] = report;
    }
  }
}