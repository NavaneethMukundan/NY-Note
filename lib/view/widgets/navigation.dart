import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_data_in_state/controller/provider.dart';
import 'package:student_data_in_state/view/home/home.dart';
import 'package:student_data_in_state/view/profile/profile.dart';

class NavigationBarPage extends StatelessWidget {
  NavigationBarPage({Key? key}) : super(key: key);

  final pages = [HomeScren(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StudentDataProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: pages[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          //backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: provider.currentIndex,
          onTap: (newIndex) {
            provider.currentIndex = newIndex;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            //BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
