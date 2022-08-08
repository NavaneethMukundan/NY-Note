import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_data_in_state/provider/student_model.dart';
import 'package:student_data_in_state/screens/details.dart';
import 'package:student_data_in_state/screens/edit.dart';
import 'package:student_data_in_state/screens/search.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          toolbarHeight: 80,
          title: const Center(
              child: Text(
            'Students Details',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchScreensss());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 26,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SafeArea(
              child: Consumer<StudentDataList>(
            builder: (context, value, child) => ListView.separated(
              itemBuilder: (context, index) {
                final data = value.studentList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: MemoryImage(const Base64Decoder().convert(
                      data.image.toString(),
                    )),
                  ),
                  title: Text(data.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => EditingPage(
                                        student: data,
                                      )),
                            );
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            Provider.of<StudentDataList>(context, listen: false)
                                .deleteStudentData(context, index);
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => UserDetails(
                              studentModel: data,
                            )));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: value.studentList.length,
            ),
          )),
        ));
  }
}
