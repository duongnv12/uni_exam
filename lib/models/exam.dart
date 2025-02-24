class Exam {
  final String id;
  final String examCode;
  final String subjectId;
  final DateTime startTime;
  final DateTime endTime;

  Exam({
    required this.id,
    required this.examCode,
    required this.subjectId,
    required this.startTime,
    required this.endTime,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      examCode: json['examCode'],
      subjectId: json['subjectId'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'examCode': examCode,
      'subjectId': subjectId,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };
  }
}