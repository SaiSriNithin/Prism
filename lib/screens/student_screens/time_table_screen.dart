import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:new_prism/models/timetable_model.dart';
import 'package:new_prism/services/error_handler.dart';
import 'package:new_prism/services/students_service.dart';

class StudentTimeTableScreen extends StatefulWidget {
  final String regulation;
  final String department;
  final String section;
  const StudentTimeTableScreen(
      {super.key,
      required this.regulation,
      required this.department,
      required this.section});

  @override
  State<StudentTimeTableScreen> createState() => _StudentTimeTableScreenState();
}

class _StudentTimeTableScreenState extends State<StudentTimeTableScreen> {
  List<TimeTableView> timeTable = [];
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    getTimetableIsolate();
  }

  getTimetableIsolate() async {
    final timetableReceivePort = ReceivePort();

    await Isolate.spawn(getTimeTableForStudents, {
      'sendPort': timetableReceivePort.sendPort,
      'regulation': widget.regulation,
      'department': widget.department,
      'section': widget.section
    });

    timetableReceivePort.listen((dynamic message) {
      if (message is List<TimeTableView>) {
        setState(() {
          timeTable = message;
        });
      } else {
        showSnackBar(context, "something went wrong");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Time Table",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.background),
        ),
        elevation: 2,
      ),
      body: Column(
        children: [
          _customBackgroundExample(),
          timeTable.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Expanded(
                  child: date.weekday <= 6
                      ? timeTable[date.weekday - 1].Periods.isNotEmpty
                          ? ListView.builder(
                              itemCount:
                                  timeTable[date.weekday - 1].Periods.length,
                              itemBuilder: (BuildContext context, int index) {
                                final temp =
                                    timeTable[date.weekday - 1].Periods[index];
                                return ListTile(
                                  leading: Text(
                                    temp.classType,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  title: Text(
                                      "${temp.className} (${temp.lecturerName})",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  subtitle: Text(
                                      "${temp.startTime} - ${temp.endTime}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                );
                              },
                            )
                          : Center(
                              child: Text("No Classes",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            )
                      : Center(
                          child: Text("Today is sunday",
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                ),
        ],
      ),
    );
  }

  EasyDateTimeLine _customBackgroundExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
        setState(() {
          date = selectedDate;
        });
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      dayProps: const EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3371FF),
                Color(0xff8426D6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
