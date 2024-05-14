// ignore_for_file: non_constant_identifier_names

import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:new_prism/models/sem_marks_model.dart';
import 'package:new_prism/services/error_handler.dart';
import 'package:new_prism/services/students_service.dart';

class SemMarksScreen extends StatefulWidget {
  const SemMarksScreen({super.key, required this.sem, required this.rollNo});
  final String sem;
  final String rollNo;
  @override
  State<SemMarksScreen> createState() => _SemMarksScreenState();
}

class _SemMarksScreenState extends State<SemMarksScreen> {
  bool isError = false;
  List<SemMarks> marks = [];
  @override
  void initState() {
    super.initState();
    gettingdataIsolate();
  }

  void gettingdataIsolate() async {
    final semMarksRecievePort = ReceivePort();

    await Isolate.spawn(getmarks, {
      'sendPort': semMarksRecievePort.sendPort,
      'rollno': widget.rollNo,
      'sem': widget.sem
    });
    semMarksRecievePort.listen((message) {
      if (message is List<SemMarks>) {
        setState(() {
          marks = message;
        });
      } else {
        showSnackBar(context, message);
      }
    });
  }

  Iterable<DataRow> mapSemMarksToList(List<SemMarks> semmarks) {
    Iterable<DataRow> dataRows = semmarks.map(
      (semmark) => DataRow(
        cells: [
          DataCell(
            Text(
              semmark.CourseCode,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DataCell(
            Text(
              semmark.CourseName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DataCell(
            Text(
              semmark.Int.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DataCell(
            Text(
              semmark.Ext.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DataCell(
            Text(
              semmark.Total.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DataCell(
            Text(
              semmark.GradePoints.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DataCell(
            Text(
              semmark.Grade,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DataCell(
            Text(
              semmark.Credits.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sem ${widget.sem}",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
      ),
      body: marks.isEmpty && isError == false
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : isError
              ? const Center(
                  child: Text(
                      "Something went wrong or resultrs aren't updated yet !!!"),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: DataTable2(
                          dataRowHeight: 60,
                          columnSpacing: 10,
                          horizontalMargin: 12,
                          minWidth: 600,
                          lmRatio: 2,
                          columns: const [
                            DataColumn2(
                              label: Text('Course\nCode'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              fixedWidth: 150,
                              label: Text('Course\nName'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Internal'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('External'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              fixedWidth: 50,
                              label: Text('Total'),
                              //size: ColumnSize.L,
                              numeric: true,
                            ),
                            DataColumn2(
                              label: Text('Grade\nPoints'),
                              size: ColumnSize.L,
                              numeric: true,
                            ),
                            DataColumn2(
                              label: Text('Grade'),
                              size: ColumnSize.L,
                              numeric: true,
                            ),
                            DataColumn2(
                              label: Text('Credits'),
                              size: ColumnSize.L,
                              numeric: true,
                            ),
                          ],
                          rows: mapSemMarksToList(marks).toList(),
                        ),
                      ),
                    )
                  ],
                ),
    );
  }
}
