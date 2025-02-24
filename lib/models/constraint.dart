class Constraint {
  final String id;
  final String constraintCode;
  final String subjectId;
  final String teacherId;
  final String roomId;
  final DateTime startTime;
  final DateTime endTime;

  Constraint({
    required this.id,
    required this.constraintCode,
    required this.subjectId,
    required this.teacherId,
    required this.roomId,
    required this.startTime,
    required this.endTime,
  });

  factory Constraint.fromJson(Map<String, dynamic> json) {
    return Constraint(
      id: json['id'],
      constraintCode: json['constraintCode'],
      subjectId: json['subjectId'],
      teacherId: json['teacherId'],
      roomId: json['roomId'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'constraintCode': constraintCode,
      'subjectId': subjectId,
      'teacherId': teacherId,
      'roomId': roomId,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };
  }
}