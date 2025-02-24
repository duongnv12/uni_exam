import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_subject_screen.dart';
import 'package:uni_exam/widgets/subject_detail_screen.dart';
import '../services/subject_service.dart';
import '../models/subject.dart';

class SubjectScreen extends StatefulWidget {
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final SubjectService _subjectService = SubjectService();
  List<Subject> _subjects = [];

  @override
  void initState() {
    super.initState();
    _subjects = _subjectService.getAllSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Môn học'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            // TODO: Navigate to add subject screen
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddSubjectScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _subjects.length,
          itemBuilder: (context, index) {
            final subject = _subjects[index];
            return CupertinoListTile(
              title: Text(subject.name),
              subtitle: Text(subject.subjectCode),
              onTap: () {
                // TODO: Navigate to subject detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SubjectDetailScreen(subject: subject),
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