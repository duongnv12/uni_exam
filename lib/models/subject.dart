class Subject {
  final String id;
  final String subjectCode;
  final String name;
  final int credit;
  final String description;
  final int registeredStudents;
  final String teacherInCharge;
  final String specialRequirements;

  Subject({
    required this.id,
    required this.subjectCode,
    required this.name,
    required this.credit,
    required this.description,
    required this.registeredStudents,
    required this.teacherInCharge,
    required this.specialRequirements,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      subjectCode: json['subjectCode'],
      name: json['name'],
      credit: json['credit'],
      description: json['description'],
      registeredStudents: json['registeredStudents'],
      teacherInCharge: json['teacherInCharge'],
      specialRequirements: json['specialRequirements'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subjectCode': subjectCode,
      'name': name,
      'credit': credit,
      'description': description,
      'registeredStudents': registeredStudents,
      'teacherInCharge': teacherInCharge,
      'specialRequirements': specialRequirements,
    };
  }
}