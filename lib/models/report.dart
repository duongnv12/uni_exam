class Report {
  final String id;
  final String reportCode;
  final String reportName;
  final String reportContent;
  final DateTime reportDate;

  Report({
    required this.id,
    required this.reportCode,
    required this.reportName,
    required this.reportContent,
    required this.reportDate,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      reportCode: json['reportCode'],
      reportName: json['reportName'],
      reportContent: json['reportContent'],
      reportDate: DateTime.parse(json['reportDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reportCode': reportCode,
      'reportName': reportName,
      'reportContent': reportContent,
      'reportDate': reportDate.toIso8601String(),
    };
  }
}