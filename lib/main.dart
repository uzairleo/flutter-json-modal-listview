import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json_modal_lis/student-list.dart';
import 'package:flutter_json_modal_lis/student-model.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isReady = false;
  
  StudentList student;
  List<dynamic> studentsList = [];
  
  
  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/student.json');
  }
  Future loadStudents()
   async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
  //  studentsList.addAll(jsonResponse.map((i)=>StudentModel.fromJson(i)).toList());
    student=StudentList.fromJson(jsonResponse);
    studentsList=(jsonResponse.map((i)=>Student.fromJson(i)).toList());   
    setState(() {
      isReady = true;
    });
    print(student.studentsList.length);
  }

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter json parsing",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter-Json-Parsing-list"),
          ),
          body: isReady ? _body() : CircularProgressIndicator()),
    );
  }

  _body() {
    return ListView.builder(
      physics:BouncingScrollPhysics(),
        itemCount:studentsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[150],
                  child: Text("${studentsList[index].stdId}"),
                ),
                title: Text("${studentsList[index].stdName}"),
                trailing: Text("Score ${studentsList[index].stdScore}"),
              ),
           );
        });
  }
}
