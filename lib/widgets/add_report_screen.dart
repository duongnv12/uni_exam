import 'package:flutter/cupertino.dart';
import '../models/report.dart';
import '../services/report_service.dart';

class AddReportScreen extends StatefulWidget {
  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _reportService = ReportService();
  final _reportCodeController = TextEditingController();
  final _reportNameController = TextEditingController();
  final _reportContentController = TextEditingController();
  final _reportDateController = TextEditingController();

  void _addReport() {
    if (_formKey.currentState!.validate()) {
      final report = Report(
        id: DateTime.now().toString(), // Generate a unique ID
        reportCode: _reportCodeController.text,
        reportName: _reportNameController.text,
        reportContent: _reportContentController.text,
        reportDate: DateTime.parse(_reportDateController.text),
      );
      _reportService.createReport(report);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Thêm báo cáo'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Mã báo cáo'),
                  controller: _reportCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã báo cáo';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Tên báo cáo'),
                  controller: _reportNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên báo cáo';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Nội dung báo cáo'),
                  controller: _reportContentController,
                  maxLines: 5,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text('Ngày báo cáo'),
                  controller: _reportDateController,
                  placeholder: 'YYYY-MM-DD',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập ngày báo cáo';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CupertinoButton.filled(
                    child: Text('Thêm'),
                    onPressed: _addReport,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}