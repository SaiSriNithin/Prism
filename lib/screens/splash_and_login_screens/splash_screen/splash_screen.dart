// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_prism/providers/splash_providers.dart';
import 'package:new_prism/screens/splash_and_login_screens/onboarding_scrrens/onboarding_screen.dart';
import 'package:new_prism/screens/splash_and_login_screens/splash_screen/splash_functions.dart';
import 'package:new_prism/screens/student_screens/navbar.dart';
import 'package:new_prism/services/error_handler.dart';
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
          getStudentDetailsThread(context, token, studentDataState),
          getStudentAttendanceThread(context, token, attendanceDataState),
          getStudentPerformanceThread(context, token, performanceDataState),
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
        final studentDataState =
            Provider.of<GetStudentData>(context, listen: false);
        final attendanceDataState =
            Provider.of<GetAttendanceData>(context, listen: false);
        final performanceDataState =
            Provider.of<GetPerformanceData>(context, listen: false);
        // Start all isolate operations concurrently

        await Future.wait([
          getStudentDetailsThread(context, token, studentDataState),
          getStudentAttendanceThread(context, token, attendanceDataState),
          getStudentPerformanceThread(context, token, performanceDataState),
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
