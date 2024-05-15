import 'package:flutter/material.dart';
import 'package:new_prism/providers/attendance_provider.dart';
import 'package:new_prism/screens/student_screens/attendance_screen/widgets/attendance_guage.dart';
import 'package:new_prism/screens/student_screens/attendance_screen/widgets/linear_proress_bar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    final userAttendance = Provider.of<AttendanceProvider>(context).attendance;
    final formatter = DateFormat.yMMMEd();
    String formattedDate() {
      return formatter.format(DateTime.now());
    }

    Widget dayStatus = Center(
      child: Text(
        "Absent",
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Theme.of(context).colorScheme.error),
      ),
    );
    if (userAttendance.DayPresent == 1) {
      dayStatus = Center(
        child: Text(
          "Half Day Present",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      );
    } else if (userAttendance.DayPresent == 2) {
      dayStatus = Center(
        child: Text(
          "Full Day Present",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Attendance",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Image.asset(
              'assets/MREC_logo.png',
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 8,
            ),
          ],
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "This is your attendace summary",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.28),
                    offset: const Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                surfaceTintColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Total percentage ",
                      style: TextStyle(
                          fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          child: Center(
                            child: AttendanceGuage(
                              totalAttendance:
                                  double.parse(userAttendance.SemPercentage) /
                                      100,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 14,
                            ),
                            SizedBox(
                              child: Center(
                                child: Text(
                                  "${userAttendance.SemPercentage}%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MonthlyAttendance(),
                //   ),
                // );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.28),
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: Colors.white,
                  surfaceTintColor: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly Percentage',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            Text(
                              '${userAttendance.MonthlyPercentage}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                          ],
                        ),
                        LinearProgressBar(
                          progressPer:
                              double.parse(userAttendance.MonthlyPercentage) /
                                  100,
                          barcolor: const Color.fromARGB(255, 243, 180, 33),
                        ),
                        Text(
                          'tap to show more',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Date  ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                          Text(formattedDate(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Day ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface)),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          dayStatus,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
