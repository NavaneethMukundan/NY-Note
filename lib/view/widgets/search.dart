import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_data_in_state/controller/student_model.dart';
import 'package:student_data_in_state/view/profile/details.dart';

class SearchScreensss extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<StudentDataList>(
        builder: (context, studentList, Widget? child) {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            final data =
                Provider.of<StudentDataList>(context).studentList[index];
            if (query == data.name.toLowerCase() ||
                query == data.name.toUpperCase()) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      MemoryImage(const Base64Decoder().convert(data.image)),
                  radius: 35,
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      (MaterialPageRoute(builder: (ctx) {
                        return UserDetails(studentModel: data);
                      })),
                      (route) => false);
                },
                title: Text(data.name.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    )),
                // trailing: IconButton(
                //   onPressed: () {
                //     DeleteVerification(context: context, index: index)
                //         .deleteFunction();
                //   },
                //   icon: const Icon(
                //     Icons.delete,
                //     color: Colors.red,
                //     size: 20,
                //   ),
                // ),
              );
            } else {
              return const SizedBox();
            }
          },
          separatorBuilder: (context, value) {
            return const Divider();
          },
          itemCount: Provider.of<StudentDataList>(context).studentList.length,
        ),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Consumer<StudentDataList>(
          builder: (context, studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data =
                Provider.of<StudentDataList>(context).studentList[index];
            if (data.name.toLowerCase().contains(query)) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      MemoryImage(const Base64Decoder().convert(data.image)),
                  radius: 35,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    (MaterialPageRoute(builder: (ctx) {
                      return UserDetails(studentModel: data);
                    })),
                  );
                },
                title: Text(
                  data.name.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                // trailing: IconButton(
                //   onPressed: () {
                //     DeleteVerification(context: context, index: index)
                //         .deleteFunction();
                //   },
                //   icon: const Icon(
                //     Icons.delete,
                //     color: Colors.red,
                //     size: 20,
                //   ),
                // ),
              );
            } else {
              return const SizedBox();
            }
          },
          separatorBuilder: (context, value) {
            return const Divider();
          },
          itemCount: Provider.of<StudentDataList>(context).studentList.length,
        );
      }),
    );
  }
}
