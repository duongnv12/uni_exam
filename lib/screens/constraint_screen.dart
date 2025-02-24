import 'package:flutter/cupertino.dart';
import 'package:uni_exam/widgets/add_constraint_screen.dart';
import 'package:uni_exam/widgets/constraint_detail_screen.dart';
import '../services/constraint_service.dart';
import '../models/constraint.dart';

class ConstraintScreen extends StatefulWidget {
  @override
  _ConstraintScreenState createState() => _ConstraintScreenState();
}

class _ConstraintScreenState extends State<ConstraintScreen> {
  final ConstraintService _constraintService = ConstraintService();
  List<Constraint> _constraints = [];

  @override
  void initState() {
    super.initState();
    _constraints = _constraintService.getAllConstraints();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Ràng buộc'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddConstraintScreen()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: _constraints.length,
          itemBuilder: (context, index) {
            final constraint = _constraints[index];
            return CupertinoListTile(
              title: Text(constraint.constraintCode),
              subtitle: Text(
                'Start: ${constraint.startTime}, End: ${constraint.endTime}',
              ),
              onTap: () {
                // TODO: Navigate to constraint detail screen
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ConstraintDetailScreen(constraint: constraint),
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
