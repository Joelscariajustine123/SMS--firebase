// import 'package:flutter/material.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Image.asset("assets/image/logo.png"),
//         title: Text("Slot Management System"),
//         backgroundColor: Colors.purple,
//       ),
//       body: Container(
//         color: Colors.amber,
//         child: Column(
//           children: [
//             SizedBox(height: 35,),
//             Row(
//               children: [
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Container(
//                     color: Colors.purple,
//                     child: Center(
//                       child: Column(
//                         children: [
//                           SizedBox(height: 40,),
//                           Icon(Icons.list),
//                           SizedBox(height: 20,),
//                           Text("Ongoing Students")],
//                       )
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Center(
//                     child: Container(
//                       color: Colors.purple,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 40,),
//                             Icon(Icons.list),
//                             SizedBox(height: 20,),
//                             Text("Completed Students")],
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 35,),
//             Row(
//               children: [
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Container(
//                     color: Colors.purple,
//                     child: Center(
//                       child: Column(
//                         children: [
//                           SizedBox(height: 40,),
//                           Icon(Icons.list),
//                           SizedBox(height: 20,),
//                           Text("Project details")],
//                       )
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Center(
//                     child: Container(
//                       color: Colors.purple,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 40,),
//                             Icon(Icons.list),
//                             SizedBox(height: 20,),
//                             Text("Courses")],
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 35,),
//             Row(
//               children: [
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Container(
//                     color: Colors.purple,
//                     child: Center(
//                       child: Column(
//                         children: [
//                           SizedBox(height: 40,),
//                           Icon(Icons.list),
//                           SizedBox(height: 20,),
//                           Text("Student under each Course")],
//                       )
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Center(
//                     child: Container(
//                       color: Colors.purple,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 40,),
//                             Icon(Icons.list),
//                             SizedBox(height: 20,),
//                             Text("Count of students in each course")],
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 35,),
//             Row(
//               children: [
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Container(
//                     color: Colors.purple,
//                     child: Center(
//                       child: Column(
//                         children: [
//                           SizedBox(height: 40,),
//                           Icon(Icons.list),
//                           SizedBox(height: 20,),
//                           Text("Students under each teacher")],
//                       )
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Center(
//                     child: Container(
//                       color: Colors.purple,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 40,),
//                             Icon(Icons.list),
//                             SizedBox(height: 20,),
//                             Text("Time slot available")],
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 35,),
//             Row(
//               children: [
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Container(
//                     color: Colors.purple,
//                     child: Center(
//                       child: Column(
//                         children: [
//                           SizedBox(height: 40,),
//                           Icon(Icons.list),
//                           SizedBox(height: 20,),
//                           Text("Register Student")],
//                       )
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Center(
//                     child: Container(
//                       color: Colors.purple,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 40,),
//                             Icon(Icons.list),
//                             SizedBox(height: 20,),
//                             Text("Add project details")],
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 35,),
//             Row(
//               children: [
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Container(
//                     color: Colors.purple,
//                     child: Center(
//                       child: Column(
//                         children: [
//                           SizedBox(height: 40,),
//                           Icon(Icons.list),
//                           SizedBox(height: 20,),
//                           Text("Student details of completion in that month")],
//                       )
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 35),
//                 SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: Center(
//                     child: Container(
//                       color: Colors.purple,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 40,),
//                             Icon(Icons.list),
//                             SizedBox(height: 20,),
//                             Text("Add course")],
//                         )
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Image.asset("assets/image/logo.png"),
//         title: const Text("Slot Management System"),
//         backgroundColor: Colors.purple,
//       ),
//       body: Container(
//         width: double.infinity,
//         color: Colors.amber,
//         padding: const EdgeInsets.symmetric(vertical: 35),
//         child: GridView.count(
//           crossAxisCount: 2,
//           mainAxisSpacing: 30,
//           crossAxisSpacing: 30,
//           padding: const EdgeInsets.symmetric(horizontal: 35),
//           children: _dashboardTiles,
//         ),
//       ),
//     );
//   }

//   // ----- dashboard tiles -----
//   List<Widget> get _dashboardTiles => [
//         _tile("Ongoing\nStudents"),
//         _tile("Completed\nStudents"),
//         _tile("Project\nDetails"),
//         _tile("Courses"),
//         _tile("Students\nper Course"),
//         _tile("Count per\nCourse"),
//         _tile("Students per\nTeacher"),
//         _tile("Available\nTime Slots"),
//         _tile("Register\nStudent"),
//         _tile("Add Project\nDetails"),
//         _tile("Due this\nMonth"),
//         _tile("Add Course"),
//         _tile("logout"),
//       ];

//   Widget _tile(String label) => InkWell(
//         onTap: () {
//           // TODO: navigate to specific screen
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.purple,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 label,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   height: 1.2,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
// }



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/add_course.dart';
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
              MaterialPageRoute(builder: (_) => const Listview()),
            );
          },
        ),
        DashboardItem("Completed\nStudents", () {}),
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
        DashboardItem("Add Project\nDetails", () {}),
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
