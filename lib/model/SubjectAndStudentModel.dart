class Subject {
  final int subjectId;
  final String subjectName;

  Subject({required this.subjectId, required this.subjectName});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectId: json['subjectId'],
      subjectName: json['subjectName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectId': subjectId,
      'subjectName': subjectName,
    };
  }
}

class Student {
  final String name;
  final int sem;
  final int classRoll;
  final String departmentName;
  final String id;
  final List<Subject> subjects;

  Student({
    required this.name,
    required this.sem,
    required this.classRoll,
    required this.departmentName,
    required this.id,
    required this.subjects,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    var subjectList = json['subjects'] as List;
    List<Subject> subjects = subjectList.map((i) => Subject.fromJson(i)).toList();

    return Student(
      name: json['name'],
      sem: json['sem'],
      classRoll: json['classRoll'],
      departmentName: json['departmentName'],
      id: json['id'],
      subjects: subjects,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sem': sem,
      'classRoll': classRoll,
      'departmentName': departmentName,
      'id': id,
      'subjects': subjects.map((subject) => subject.toJson()).toList(),
    };
  }
}
