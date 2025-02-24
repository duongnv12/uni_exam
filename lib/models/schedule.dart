class Schedule {
  final String id;
  final String scheduleCode;
  final String classId;
  final String roomId;
  final DateTime startTime;
  final DateTime endTime;
  final String academicYear;
  final String semester;
  final DateTime startDate;
  final DateTime endDate;

  Schedule({
    required this.id,
    required this.scheduleCode,
    required this.classId,
    required this.roomId,
    required this.startTime,
    required this.endTime,
    required this.academicYear,
    required this.semester,
    required this.startDate,
    required this.endDate,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      scheduleCode: json['scheduleCode'],
      classId: json['classId'],
      roomId: json['roomId'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      academicYear: json['academicYear'],
      semester: json['semester'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'scheduleCode': scheduleCode,
      'classId': classId,
      'roomId': roomId,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'academicYear': academicYear,
      'semester': semester,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}