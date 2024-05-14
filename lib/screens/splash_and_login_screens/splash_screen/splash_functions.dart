import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:new_prism/models/attendance_model.dart';
import 'package:new_prism/models/performance_model.dart';
import 'package:new_prism/models/student_model.dart';
import 'package:new_prism/providers/attendance_provider.dart';
import 'package:new_prism/providers/performance_provider.dart';
import 'package:new_prism/providers/splash_providers.dart';
import 'package:new_prism/providers/student_provider.dart';
import 'package:new_prism/services/error_handler.dart';
import 'package:new_prism/services/students_service.dart';
import 'package:provider/provider.dart';

Future<void> getStudentPerformanceThread(BuildContext context, String token,
    GetPerformanceData getperformnace) async {
  final performanceReceivePort = ReceivePort();
  final Completer<void> completer = Completer<void>();

  Isolate.spawn(getStudentPerformance,
      {'sendPort': performanceReceivePort.sendPort, 'token': token});
  performanceReceivePort.listen((message) {
    if (message is Performance) {
      final performanceProvider =
          Provider.of<PerformanceProvider>(context, listen: false);
      performanceProvider.setPerformanceFromModel(message);
      getperformnace.myValue(1);
      // Future.delayed(Duration(seconds: 3));

      completer.complete();
    } else if (message is String) {
      showSnackBar(context, message);
      completer.completeError(message);
    } else {
      showSnackBar(context, "Something went wrong");
      completer.completeError("Something went wrong");
    }
  });
  await completer.future;
}

Future<void> getStudentDetailsThread(
    BuildContext context, String token, GetStudentData getstudent) async {
  final studentDetailsReceivePort = ReceivePort();
  final Completer<void> completer = Completer<void>();

  await Isolate.spawn(getStudentDetails,
      {'sendPort': studentDetailsReceivePort.sendPort, 'token': token});
  studentDetailsReceivePort.listen((message) {
    if (message is StudentModel) {
      final studentProvider =
          Provider.of<StudentProvider>(context, listen: false);
      studentProvider.setUserFromModel(message);
      completer.complete();
      // Future.delayed(Duration(seconds: 3));

      getstudent.myValue(1);
    } else if (message is String) {
      showSnackBar(context, message);
      completer.completeError(message);
    } else {
      showSnackBar(context, "Something went wrong");
      completer.completeError("Something went wrong");
    }
  });
  await completer.future;
}

Future<void> getStudentAttendanceThread(
    BuildContext context, String token, GetAttendanceData getattendance) async {
  final attendanceReceivePort = ReceivePort();
  final Completer<void> completer = Completer<void>();

  await Isolate.spawn(getStudentAttendance,
      {'sendPort': attendanceReceivePort.sendPort, 'token': token});
  attendanceReceivePort.listen((message) {
    if (message is AttendanceModel) {
      final attendanceProvider =
          Provider.of<AttendanceProvider>(context, listen: false);
      attendanceProvider.setAttendanceFromModel(message);
      getattendance.myValue(1);
      // Future.delayed(Duration(seconds: 3));
      completer.complete();
    } else if (message is String) {
      showSnackBar(context, message);
      completer.completeError(message);
    } else {
      showSnackBar(context, "Something went wrong");
      completer.completeError("Something went wrong");
    }
  });
  await completer.future;
}
