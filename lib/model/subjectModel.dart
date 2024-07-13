class Subjectforchart {
  final String? subName;
  final int classAttended;
  final int totalClass;
  final int maxAttendance;

  Subjectforchart({
    required this.subName,
    required this.classAttended,
    required this.totalClass,
    required this.maxAttendance,
  });

  factory Subjectforchart.fromJson(Map<String, dynamic> json) {
    return Subjectforchart(
      subName: json['subName'], // Handling nullability
      classAttended: json['classAttended'] ?? 0,
      totalClass: json['totalClass'] ?? 0,
      maxAttendance: json['maxAttendance'] ?? 0,
    );
  }
}
