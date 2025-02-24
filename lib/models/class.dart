class Class {
  final String id;
  final String classCode;
  final String name;
  final String subjectId;
  final String teacherId;
  final int capacity;
  final List<String> studentList;

  Class({
    required this.id,
    required this.classCode,
    required this.name,
    required this.subjectId,
    required this.teacherId,
    required this.capacity,
    required this.studentList,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'],
      classCode: json['classCode'],
      name: json['name'],
      subjectId: json['subjectId'],
      teacherId: json['teacherId'],
      capacity: json['capacity'],
      studentList: List<String>.from(json['studentList']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'classCode': classCode,
      'name': name,
      'subjectId': subjectId,
      'teacherId': teacherId,
      'capacity': capacity,
      'studentList': studentList,
    };
  }
}