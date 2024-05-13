// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_prism/models/attendance_model.dart';
import 'package:new_prism/models/performance_model.dart';
import 'package:new_prism/models/student_model.dart';
import 'package:new_prism/providers/attendance_provider.dart';
import 'package:new_prism/providers/performance_provider.dart';
import 'package:new_prism/providers/splash_providers.dart';
import 'package:new_prism/providers/student_provider.dart';
import 'package:new_prism/screens/splash_and_login_screens/onboarding_scrrens/onboarding_screen.dart';
import 'package:new_prism/screens/student_screens/navbar.dart';
import 'package:new_prism/services/error_handler.dart';
import 'package:new_prism/services/students_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int countdown = 0;
  @override
  void initState() {
    super.initState();
    getCurrentLoginAndProceed();
  }

  getCurrentLoginAndProceed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboarding = prefs.getBool("onboarding") ?? false;

    if (!onboarding) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      }
    } else {
      final String current = prefs.getString("whoIsSignedIn")!;
      debugPrint(current);
      final String token = prefs.getString("x-auth-token")!;

      if (current == "Student") {
        final studentDataState =
            Provider.of<GetStudentData>(context, listen: false);
        final attendanceDataState =
            Provider.of<GetAttendanceData>(context, listen: false);
        final performanceDataState =
            Provider.of<GetPerformanceData>(context, listen: false);
        // Start all isolate operations concurrently

        await Future.wait([
          getStudentDetailsThread(token, studentDataState),
          getStudentAttendanceThread(token, attendanceDataState),
          getStudentPerformanceThread(token, performanceDataState),
        ]);

        debugPrint(
            "${studentDataState.value} - ${attendanceDataState.value} - ${performanceDataState.value}");

        // Check if all operations are completed
        if (studentDataState.value == 1 &&
            attendanceDataState.value == 1 &&
            performanceDataState.value == 1) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Navbar1()));
        } else {
          if (mounted) {
            showSnackBar(context, "heyyyy");
          }
        }
      } else if (current == "Parent") {
      } else if (current == "Faculty") {
      } else {
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnboardingScreen()));
        }
      }
    }
  }

  Future<void> getStudentAttendanceThread(
      String token, GetAttendanceData getattendance) async {
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

  Future<void> getStudentPerformanceThread(
      String token, GetPerformanceData getperformnace) async {
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
      String token, GetStudentData getstudent) async {
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

  getParentThread(String token) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/splash.json',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/MREC_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Lottie.asset('assets/lottie/loading.json',
                        fit: BoxFit.fitHeight),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
