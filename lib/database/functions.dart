
// Future<void> addStudentList(StudentModel value) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   final id = await studentDB.add(value);
//   value.id = id;

//   // studentListNotifier.value.add(value);
//   // studentListNotifier.notifyListeners();
// }

// Future<void> getAllDetails(context) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   Provider.of<StudentDataList>(context).addStudentList(data: studentDB.values);
//   // studentListNotifier.value.clear();

//   // studentListNotifier.value.addAll(studentDB.values);
//   // studentListNotifier.notifyListeners();
// }

// Future<void> deleteStudentData(context, int index) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   await studentDB.deleteAt(index);
//   getAllDetails(context);
// }
