import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:student_data_in_state/database/model.dart';

class StudentDataList with ChangeNotifier {
  StudentDataList() {
    getAllDetails();
  }
  Future<void> addStudentList(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);
    value.id = id;
    getAllDetails();
    // studentListNotifier.value.add(value);
    // studentListNotifier.notifyListeners();
  }

  Future<void> getAllDetails() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentList.clear();
    studentList.addAll(studentDB.values);
    notifyListeners();
    // studentListNotifier.value.addAll(studentDB.values);
    // studentListNotifier.notifyListeners();
  }

  Future<void> deleteStudentData(context, int index) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(index);
    getAllDetails();
  }

  List<StudentModel> studentList = [];

  // void addStudentList({required data}) {
  //   // studentList.clear();
  //   studentList.addAll(data);
  //   notifyListeners();
  // }
}
