import 'package:flutter/material.dart';
import 'package:new_prism/models/attendance_model.dart';

class AttendanceProvider extends ChangeNotifier {
  AttendanceModel _attendance = AttendanceModel(
      SemPercentage: "0.00", MonthlyPercentage: "0.00", DayPresent: 0);

  AttendanceModel get attendance => _attendance;

  void setAttendance(String attendance) {
    _attendance = AttendanceModel.fromJson(attendance);
    notifyListeners();
  }

  void setAttendanceFromModel(AttendanceModel attendance) {
    _attendance = attendance;
    notifyListeners();
  }
}
