import 'package:flutter/material.dart';

class GetStudentData extends ChangeNotifier {
  int _myValue = 0;

  int get value => _myValue;

  void myValue(int value) {
    _myValue = value;
    notifyListeners();
  }
}

class GetPerformanceData extends ChangeNotifier {
  int _myValue = 0;

  int get value => _myValue;

  void myValue(int value) {
    _myValue = value;
    notifyListeners();
  }
}

class GetAttendanceData extends ChangeNotifier {
  int _myValue = 0;

  int get value => _myValue;

  void myValue(int value) {
    _myValue = value;
    notifyListeners();
  }
}
