import 'package:flutter/material.dart';
import 'package:student_data_in_state/model/model.dart';
import 'package:student_data_in_state/view/widgets/constrants.dart';

class EditingPage extends StatelessWidget {
  EditingPage({Key? key, required this.student}) : super(key: key);
  final StudentModel student;

  final nameEditingController = TextEditingController();
  final classEditingController = TextEditingController();
  final passOrFailEditingController = TextEditingController();
  final schoolEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameEditingController.text = student.name;
    classEditingController.text = student.classs;
    passOrFailEditingController.text = student.passOrfail;
    schoolEditingController.text = student.school;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'Assets/images/edit session.jpg',
                  height: 300,
                ),
              ),
              const Text(
                'EDIT THE DATA',
                style: TextStyle(fontSize: 25),
              ),
              kHeight,
              TextField(
                controller: nameEditingController,
                decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              kHeight,
              TextField(
                controller: classEditingController,
                decoration: InputDecoration(
                    hintText: 'Class',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              kHeight,
              TextField(
                controller: passOrFailEditingController,
                decoration: InputDecoration(
                    hintText: 'Pass Or Fail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              kHeight,
              TextField(
                controller: schoolEditingController,
                decoration: InputDecoration(
                    hintText: 'School',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              kHeight,
              ElevatedButton(
                  onPressed: () {
                    student.name = nameEditingController.text;
                    student.classs = classEditingController.text;
                    student.passOrfail = passOrFailEditingController.text;
                    student.school = schoolEditingController.text;
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 50),
                      shape: const StadiumBorder()),
                  child: const Text('Save'))
            ],
          ),
        ),
      )),
    );
  }
}
