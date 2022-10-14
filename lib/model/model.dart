import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  int? id;

  @HiveField(0)
  String name;

  @HiveField(1)
  String passOrfail;

  @HiveField(2)
  String classs;

  @HiveField(3)
  String school;

  @HiveField(4)
  String image;

  StudentModel(
      {required this.name,
      required this.passOrfail,
      required this.classs,
      required this.school,
      required this.image,
      this.id});
}
