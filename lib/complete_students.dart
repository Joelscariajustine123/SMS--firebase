import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/add_project_details.dart';
import 'package:todo_app/homescreen.dart';
import 'package:todo_app/login.dart';

class CompleteStudents extends StatefulWidget {
  const CompleteStudents({super.key});

  @override
  State<CompleteStudents> createState() => _CompleteStudentsState();
}

class _CompleteStudentsState extends State<CompleteStudents> {
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const Login()),
        (route) => false,
      );
    }
  }

  void _goHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Homescreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: InkWell(
          onTap: _goHome,
          child: Image.asset("assets/image/logo.png"),
        ),
        title: const Text("List of Students"),
      ),
      backgroundColor: Colors.amber,

      body: Column(
        children: [
          // student list
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (_, index) => _studentTile(index),
            ),
          ),

          // bottom row: Home + Logout
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            color: Colors.purple.shade50,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.home),
                    label: const Text("Home"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: _goHome,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: _logout,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // list item
  Widget _studentTile(int index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.person, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text('Student $index',
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
            _actionButton(
  text: 'Edit',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddProjectDetails()),
    );
  },
),

            const SizedBox(width: 8),
            _actionButton(text: 'Details',onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CompleteStudents()),
    );
  },),
          ],
        ),
      );

  // action buttons
  Widget _actionButton({String? text, void Function()? onPressed}) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.purple,
        ),
        onPressed: onPressed ?? () {},
        child: Text(text ?? ''),
      );
}
