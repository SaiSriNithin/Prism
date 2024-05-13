// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class StudentModel {
  final String StudentName;
  final String StudentPhnNo;
  final String StudentEmail;
  final String FatherName;
  final String FatherPhnNo;
  final String FatherEmail;
  final String MotherName;
  final String MotherPhnNo;
  final String MotherEmail;
  final String RollNo;
  final String ImageUrl;
  final int Semester;
  final String Department;
  final String Regulation;

  final String Section;
  final String Actions;
  final bool FeeStatus;
  StudentModel({
    required this.StudentName,
    required this.StudentPhnNo,
    required this.StudentEmail,
    required this.FatherName,
    required this.FatherPhnNo,
    required this.FatherEmail,
    required this.MotherName,
    required this.MotherPhnNo,
    required this.MotherEmail,
    required this.RollNo,
    required this.ImageUrl,
    required this.Semester,
    required this.Department,
    required this.Regulation,
    required this.Section,
    required this.Actions,
    required this.FeeStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'StudentName': StudentName,
      'StudentPhnNo': StudentPhnNo,
      'StudentEmail': StudentEmail,
      'FatherName': FatherName,
      'FatherPhnNo': FatherPhnNo,
      'FatherEmail': FatherEmail,
      'MotherName': MotherName,
      'MotherPhnNo': MotherPhnNo,
      'MotherEmail': MotherEmail,
      'RollNo': RollNo,
      'ImageUrl': ImageUrl,
      'Semester': Semester,
      'Department': Department,
      'Regulation': Regulation,
      'Section': Section,
      'Actions': Actions,
      'FeeStatus': FeeStatus,
    };
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      StudentName: map['StudentName'] as String,
      StudentPhnNo: map['StudentPhnNo'] as String,
      StudentEmail: map['StudentEmail'] as String,
      FatherName: map['FatherName'] as String,
      FatherPhnNo: map['FatherPhnNo'] as String,
      FatherEmail: map['FatherEmail'] as String,
      MotherName: map['MotherName'] as String,
      MotherPhnNo: map['MotherPhnNo'] as String,
      MotherEmail: map['MotherEmail'] as String,
      RollNo: map['RollNo'] as String,
      ImageUrl: map['ImageUrl'] as String,
      Semester: map['Semester'] as int,
      Department: map['Department'] as String,
      Regulation: map['Regulation'] as String,
      Section: map['Section'] as String,
      Actions: map['Actions'] as String,
      FeeStatus: map['FeeStatus'] as bool,
    );
  }

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
