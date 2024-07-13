// models/schedule.dart

class Schedule {
  final String subName;
  final String roomName;
  final String teacherName;
  final String paperCode;
  final String startingTime;
  final String endingTime;

  Schedule({
    required this.subName,
    required this.roomName,
    required this.teacherName,
    required this.paperCode,
    required this.startingTime,
    required this.endingTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      subName: json['subName'],
      roomName: json['roomName'],
      teacherName: json['teacherName'],
      paperCode: json['paperCode'],
      startingTime: json['startingTime'],
      endingTime: json['endingTime'],
    );
  }
}
