import 'package:flutter/cupertino.dart';
import '../models/constraint.dart';

class ConstraintDetailScreen extends StatelessWidget {
  final Constraint constraint;

  ConstraintDetailScreen({required this.constraint});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(constraint.constraintCode),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mã ràng buộc: ${constraint.constraintCode}'),
              SizedBox(height: 8.0),
              Text('Mã môn học: ${constraint.subjectId}'),
              SizedBox(height: 8.0),
              Text('Mã giáo viên: ${constraint.teacherId}'),
              SizedBox(height: 8.0),
              Text('Mã phòng học: ${constraint.roomId}'),
              SizedBox(height: 8.0),
              Text('Thời gian bắt đầu: ${constraint.startTime}'),
              SizedBox(height: 8.0),
              Text('Thời gian kết thúc: ${constraint.endTime}'),
            ],
          ),
        ),
      ),
    );
  }
}