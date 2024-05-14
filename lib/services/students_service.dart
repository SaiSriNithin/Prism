import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_prism/models/attendance_model.dart';
import 'package:new_prism/models/performance_model.dart';
import 'package:new_prism/models/sem_marks_model.dart';
import 'package:new_prism/models/student_model.dart';
import 'package:new_prism/models/timetable_model.dart';
import 'package:new_prism/services/ip.dart';

getStudentDetails(Map<String, dynamic> message) async {
  final SendPort sendPort = message['sendPort'];
  final String token = message['token'];
  try {
    var response = await http.get(
      Uri.parse('$ip/api/student/getuserdata'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      StudentModel student = StudentModel.fromJson(response.body);
      sendPort.send(student);
    } else {
      sendPort.send("error in else");
    }
  } catch (err) {
    debugPrint(err.toString());
    sendPort.send("error in catch : $err");
  }
}

getStudentAttendance(Map<String, dynamic> message) async {
  final SendPort sendPort = message['sendPort'];
  final String token = message['token'];
  try {
    // var attendanceProvider =
    //     Provider.of<AttendanceProvider>(context, listen: false);

    http.Response userRes = await http.get(
      Uri.parse('$ip/api/attendance/getatten'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    debugPrint(userRes.body);
    if (userRes.statusCode == 200) {
      AttendanceModel attendance = AttendanceModel.fromJson(userRes.body);
      sendPort.send(attendance);
    } else {
      sendPort.send("error in else");
    }
  } catch (err) {
    debugPrint(err.toString());
    sendPort.send("error in catch : $err");
  }
}

getStudentPerformance(Map<String, dynamic> message) async {
  final SendPort sendPort = message['sendPort'];
  final String token = message['token'];
  try {
    // var performanceProvider =
    //     Provider.of<PerformanceProvider>(context, listen: false);

    http.Response userRes = await http.get(
      Uri.parse('$ip/api/performance/getper'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    debugPrint(userRes.body);

    if (userRes.statusCode == 200) {
      Performance performance = Performance.fromJson(userRes.body);

      sendPort.send(performance);
    } else {
      sendPort.send("error in else");
    }
  } catch (err) {
    debugPrint(err.toString());
    sendPort.send("error in catch : $err");
  }
}

getTimeTableForStudents(Map<String, dynamic> message) async {
  final SendPort sendPort = message['sendPort'];
  final String regulation = message['regulation'];
  final String department = message['department'];
  final String section = message['section'];

  try {
    http.Response response = await http.get(
      Uri.parse(
          '$ip/api/setTimetable/getsectionSpecificTimeTable?regulation=$regulation&department=$department&section=$section'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List<TimeTableView> timeTableViews = [];
      for (var item in result) {
        String day = item['Day'];
        List<Period> periods = [];
        for (var periodData in item['Periods']) {
          Period period = Period(
            id: periodData['_id'],
            startTime: periodData['StartTime'],
            endTime: periodData['EndTime'],
            classType: periodData['ClassType'],
            className: periodData['ClassName'],
            subjectName: periodData['SubjectName'],
            subjectCode: periodData['Subjectcode'],
            lecturerName: periodData['LecturerName'],
            lecturerId: periodData['LecturerId'],
            lecturerNumber: periodData['LecturerNumber'],
            substitute: periodData['Substitute'],
          );
          periods.add(period);
        }

        TimeTableView timeTableView = TimeTableView(
          Day: day,
          Periods: periods,
        );
        timeTableViews.add(timeTableView);
      }
      sendPort.send(timeTableViews);
    } else {
      sendPort.send(response.statusCode);
    }
  } catch (err) {
    debugPrint(err.toString());
    sendPort.send("error in catch : $err");
  }
}

getmarks(Map<String, dynamic> message) async {
  List<SemMarks> dummy = [];
  final SendPort sendPort = message['sendPort'];
  final String rollno = message['rollno'];
  final String sem = message['sem'];

  try {
    http.Response response = await http.get(
      Uri.parse('$ip/api/semmarks/find?roolno=$rollno&sem=sem$sem'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        SemMarks post = SemMarks.fromMap(result[i] as Map<String, dynamic>);
        dummy.add(post);
      }
      sendPort.send(dummy);
    } else {
      sendPort.send(response.statusCode);
    }
  } catch (err) {
    debugPrint(err.toString());
    sendPort.send("error in catch : $err");
  }
}
