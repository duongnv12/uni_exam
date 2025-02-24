import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_report_screen.dart';
import 'package:uni_exam/widgets/report_detail_screen.dart';
import '../services/report_service.dart';
import '../models/report.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ReportService _reportService = ReportService();
  List<Report> _reports = [];

  @override
  void initState() {
    super.initState();
    _reports = _reportService.getAllReports();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Báo cáo'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add report screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddReportScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _reports.length,
          itemBuilder: (context, index) {
            final report = _reports[index];
            return CupertinoListTile(
              title: Text(report.reportName),
              subtitle: Text(report.reportCode),
              onTap: () {
                // TODO: Navigate to report detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ReportDetailScreen(report: report)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}