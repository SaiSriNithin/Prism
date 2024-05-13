// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AttendanceModel {
  var SemPercentage;
  var MonthlyPercentage;
  final int DayPresent;
  AttendanceModel({
    required this.SemPercentage,
    required this.MonthlyPercentage,
    required this.DayPresent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'SemPercentage': SemPercentage.toMap(),
      'MonthlyPercentage': MonthlyPercentage.toMap(),
      'DayPresent': DayPresent,
    };
  }

  String toJson() => json.encode(toMap());

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      SemPercentage: map['SemPercentage'].toString(),
      MonthlyPercentage: map['MonthlyPercentage'].toString(),
      DayPresent: map['DayPresent'] as int,
    );
  }

  factory AttendanceModel.fromJson(String source) =>
      AttendanceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
