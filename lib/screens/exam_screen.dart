import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_exam_screen.dart';
import 'package:uni_exam/widgets/exam_detail_screen.dart';
import '../services/exam_service.dart';
import '../models/exam.dart';

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final ExamService _examService = ExamService();
  List<Exam> _exams = [];

  @override
  void initState() {
    super.initState();
    _exams = _examService.getAllExams();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Kỳ thi'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add exam screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddExamScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _exams.length,
          itemBuilder: (context, index) {
            final exam = _exams[index];
            return CupertinoListTile(
              title: Text(exam.examCode),
              subtitle: Text('Start: ${exam.startTime}, End: ${exam.endTime}'),
              onTap: () {
                // TODO: Navigate to exam detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ExamDetailScreen(exam: exam),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
