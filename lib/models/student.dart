class Student {
  final String id;
  final String studentCode;
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final String contactInfo;
  final String classId;

  Student({
    required this.id,
    required this.studentCode,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.contactInfo,
    required this.classId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      studentCode: json['studentCode'],
      name: json['name'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      gender: json['gender'],
      contactInfo: json['contactInfo'],
      classId: json['classId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentCode': studentCode,
      'name': name,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'contactInfo': contactInfo,
      'classId': classId,
    };
  }
}