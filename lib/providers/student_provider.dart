import 'package:flutter/material.dart';
import 'package:new_prism/models/student_model.dart';

class StudentProvider extends ChangeNotifier {
  StudentModel _student = StudentModel(
      Regulation: "",
      StudentName: "",
      StudentPhnNo: '',
      StudentEmail: '',
      FatherName: '',
      FatherPhnNo: '',
      FatherEmail: '',
      MotherName: '',
      MotherPhnNo: '',
      MotherEmail: '',
      RollNo: '',
      ImageUrl: '',
      Semester: 0,
      Department: '',
      Section: '',
      Actions: '',
      FeeStatus: false);

  StudentModel get user => _student;

  void setUser(String student) {
    _student = StudentModel.fromJson(student);
    notifyListeners();
  }

  void setUserFromModel(StudentModel student) {
    _student = student;
  }
}
