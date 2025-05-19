import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/add_course.dart';
import 'package:todo_app/add_project_details.dart';
import 'package:todo_app/complete_students.dart';
import 'package:todo_app/ongoing_list.dart'; // your Listview widget
import 'package:todo_app/register_student.dart';
import 'login.dart';   // your Login widget

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/image/logo.png"),
        title: const Text("Slot Management System"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.amber,
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
          padding: const EdgeInsets.symmetric(horizontal: 35),
          children: _items.map(_dashboardTile).toList(),
        ),
      ),
    );
  }

  // List of dashboard items with actions
  List<DashboardItem> get _items => [
        DashboardItem(
          "Ongoing\nStudents",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OngoingList()),
            );
          },
        ),
        DashboardItem("Completed\nStudents",
        () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CompleteStudents()),
            );
          },
        ),
        DashboardItem("Project\nDetails", () {}),
        DashboardItem("Courses", () {}),
        DashboardItem("Students\nper Course", () {}),
        DashboardItem("Count per\nCourse", () {}),
        DashboardItem("Students per\nTeacher", () {}),
        DashboardItem("Available\nTime Slots", () {}),
        DashboardItem("Register\nStudent", () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RegisterStudent()),
            );
        }),
        DashboardItem("Add Project\nDetails", () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddProjectDetails()),
            );
        }),
        DashboardItem("Due this\nMonth", () {}),
        DashboardItem("Add Course", () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddCourse()),
            );
        }),
        DashboardItem(
          "Logout",
          () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const Login()),
              (route) => false,
            );
          },
        ),
      ];

  // Widget for each tile
  Widget _dashboardTile(DashboardItem item) {
    return InkWell(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Model class for dashboard items
class DashboardItem {
  final String title;
  final VoidCallback onTap;
  DashboardItem(this.title, this.onTap);
}
