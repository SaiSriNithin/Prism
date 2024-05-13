import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_prism/models/attendance_model.dart';
import 'package:new_prism/models/performance_model.dart';
import 'package:new_prism/models/student_model.dart';
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
