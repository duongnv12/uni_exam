import 'package:flutter/material.dart';

class Teacher {
  final String id;
  final String teacherCode;
  final String name;
  final String faculty;
  final String contactInfo;
  final List<String> subjectList;
  final List<DateTimeRange> busySchedule;

  Teacher({
    required this.id,
    required this.teacherCode,
    required this.name,
    required this.faculty,
    required this.contactInfo,
    required this.subjectList,
    required this.busySchedule,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      teacherCode: json['teacherCode'],
      name: json['name'],
      faculty: json['faculty'],
      contactInfo: json['contactInfo'],
      subjectList: List<String>.from(json['subjectList']),
      busySchedule: (json['busySchedule'] as List)
          .map((item) => DateTimeRange(
        start: DateTime.parse(item['start']),
        end: DateTime.parse(item['end']),
      ))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacherCode': teacherCode,
      'name': name,
      'faculty': faculty,
      'contactInfo': contactInfo,
      'subjectList': subjectList,
      'busySchedule': busySchedule
          .map((range) => {
        'start': range.start.toIso8601String(),
        'end': range.end.toIso8601String(),
      })
          .toList(),
    };
  }
}