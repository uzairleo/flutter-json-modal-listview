import 'package:flutter_json_modal_lis/student-model.dart';

class StudentList {
  List<Student> studentsList;
  StudentList({
    this.studentsList,
  });

  factory StudentList.fromJson(List<dynamic> parsedJson) {
    List<Student> studentsList = new List<Student>();
    studentsList = parsedJson.map((i) => Student.fromJson(i)).toList();
    return StudentList(studentsList: studentsList);
  }
}
