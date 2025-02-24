class ExamSchedule {
  final String id;
  final String examScheduleCode;
  final String examId;
  final String roomId;
  final DateTime startTime;
  final DateTime endTime;

  ExamSchedule({
    required this.id,
    required this.examScheduleCode,
    required this.examId,
    required this.roomId,
    required this.startTime,
    required this.endTime,
  });

  factory ExamSchedule.fromJson(Map<String, dynamic> json) {
    return ExamSchedule(
      id: json['id'],
      examScheduleCode: json['examScheduleCode'],
      examId: json['examId'],
      roomId: json['roomId'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'examScheduleCode': examScheduleCode,
      'examId': examId,
      'roomId': roomId,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };
  }
}