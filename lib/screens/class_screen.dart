import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_class_screen.dart';
import 'package:uni_exam/widgets/class_detail_screen.dart';
import '../services/class_service.dart';
import '../models/class.dart';

class ClassScreen extends StatefulWidget {
  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final ClassService _classService = ClassService();
  List<Class> _classes = [];

  @override
  void initState() {
    super.initState();
    _classes = _classService.getAllClasses();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Lớp học'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddClassScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _classes.length,
          itemBuilder: (context, index) {
            final class_ = _classes[index];
            return CupertinoListTile(
              title: Text(class_.name),
              subtitle: Text(class_.classCode),
              onTap: () {
                // TODO: Navigate to class detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ClassDetailScreen(class_: class_)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
