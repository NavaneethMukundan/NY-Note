import 'dart:convert';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_data_in_state/database/model.dart';
import 'package:student_data_in_state/provider/student_model.dart';
import 'package:student_data_in_state/widgets/constrants.dart';

class HomeScren extends StatelessWidget {
  HomeScren({Key? key}) : super(key: key);

  String image = '';
  final nameController = TextEditingController();
  final clasController = TextEditingController();
  final passOrfailController = TextEditingController();
  final schoolController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('Assets/images/home_image.jpg'),
                  const Text(
                    'Fill The Form',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  kHeight,
                  TextFormField(
                    controller: clasController,
                    decoration: InputDecoration(
                        hintText: 'Class',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  kHeight,
                  TextFormField(
                    controller: passOrfailController,
                    decoration: InputDecoration(
                        hintText: 'Pass/fail',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  kHeight,
                  TextFormField(
                    controller: schoolController,
                    decoration: InputDecoration(
                        hintText: 'School',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        pickImage();
                      },
                      icon: const Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Add the Image',
                        style: TextStyle(color: Colors.black),
                      )),
                  kHeight,
                  ElevatedButton(
                      onPressed: () {
                        whenButtonClicked(context);
                        nameController.clear();
                        clasController.clear();
                        passOrfailController.clear();
                        schoolController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.black,
                          minimumSize: const Size(150, 50)),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> whenButtonClicked(BuildContext context) async {
    final name = nameController.text.trim();
    final clasS = clasController.text.trim();
    final passOrfail = passOrfailController.text.trim();
    final school = schoolController.text.trim();
    if (name.isEmpty ||
        clasS.isEmpty ||
        passOrfail.isEmpty ||
        school.isEmpty ||
        image.isEmpty) {
      return;
    } else {
      final student = StudentModel(
          name: name,
          passOrfail: passOrfail,
          classs: clasS,
          school: school,
          image: image);
      Provider.of<StudentDataList>(context, listen: false)
          .addStudentList(student);
    }
  }

  ImagePicker picker = ImagePicker();
  Future<void> pickImage() async {
    final imagePick =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePick == null) {
      return;
    } else {
      final byte = File(imagePick.path).readAsBytesSync();
      image = base64Encode(byte);
    }
  }
}
