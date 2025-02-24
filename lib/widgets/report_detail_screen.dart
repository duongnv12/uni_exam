import 'package:flutter/cupertino.dart';
import '../models/report.dart';

class ReportDetailScreen extends StatelessWidget {
  final Report report;

  ReportDetailScreen({required this.report});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(report.reportName),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã báo cáo: ${report.reportCode}'),
              SizedBox(height: 8.0),
              Text('Tên báo cáo: ${report.reportName}'),
              SizedBox(height: 8.0),
              Text('Nội dung báo cáo: ${report.reportContent}'),
              SizedBox(height: 8.0),
              Text('Ngày báo cáo: ${report.reportDate}'),
            ],
          ),
        ),
      ),
    );
  }
}