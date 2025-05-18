// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/homescreen.dart';

// class Listview extends StatefulWidget {
//   const Listview({super.key});

//   @override
//   State<Listview> createState() => _ListviewState();
// }

// class _ListviewState extends State<Listview> {
//   var listctr=TextEditingController();
//   logout() async{
//     FirebaseAuth.instance.signOut();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         leading: Image.asset("assets/image/logo.png"),
//         title: Text("List of Students"),
//         actions: [
//         IconButton(onPressed: logout, icon: Icon(Icons.logout))
//         ],
//       ),
//   backgroundColor: Colors.amber,
//   body: ListView.builder(
//     itemCount: 15,
//     itemBuilder: (context, index) {
//       return Container(
//         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.purple,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             Icon(Icons.list, color: Colors.white),
//             SizedBox(width: 10),
//             Expanded(
//               child: Text(
//                 'List $index',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 foregroundColor: Colors.purple,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Listview()),
//                 );
//               },
//               child: Text("Edit"),
//             ),
//             SizedBox(width: 8),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber,
//                 foregroundColor: Colors.purple,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Listview()),
//                 );
//               },
//               child: Text("Delete"),
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// );
// }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'homescreen.dart';   // your dashboard
// import 'login.dart';       // screen to return to after sign-out

// class Listview extends StatefulWidget {
//   const Listview({super.key});

//   @override
//   State<Listview> createState() => _ListviewState();
// }

// class _ListviewState extends State<Listview> {
//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     if (mounted) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => const Login()),
//         (route) => false,
//       );
//     }
//   }

//   void _goHome() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const Homescreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         leading: InkWell(
//            onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Homescreen()),
//                   );
//                 },
//                 child: Image.asset("assets/image/logo.png"),
//         ),
//         title: const Text("List of Students"),
//       ),
//       backgroundColor: Colors.amber,

//       body: Column(
//         children: [
//           // scrollable list
//           Expanded(
//             child: ListView.builder(
//               itemCount: 20,
//               itemBuilder: (_, index) => _studentTile(index),
//             ),
//           ),

//           // bottom bar with Home & Logout
//           // Container(
//           //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//           //   color: Colors.purple.shade50,
//           //   child: Row(
//           //     children: [
//           //       Expanded(
//           //         child: ElevatedButton.icon(
//           //           icon: const Icon(Icons.home),
//           //           label: const Text("Home"),
//           //           style: ElevatedButton.styleFrom(
//           //             backgroundColor: Colors.purple,
//           //             foregroundColor: Colors.amber,
//           //             padding: const EdgeInsets.symmetric(vertical: 14),
//           //           ),
//           //           onPressed: _goHome,
//           //         ),
//           //       ),
//           //       const SizedBox(width: 16),
//           //       Expanded(
//           //         child: ElevatedButton.icon(
//           //           icon: const Icon(Icons.logout),
//           //           label: const Text("Logout"),
//           //           style: ElevatedButton.styleFrom(
//           //             backgroundColor: Colors.purple,
//           //             foregroundColor: Colors.amber,
//           //             padding: const EdgeInsets.symmetric(vertical: 14),
//           //           ),
//           //           onPressed: _logout,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   // ---- list tile ----
//   Widget _studentTile(int index) => Container(
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.purple,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             const Icon(Icons.person, color: Colors.white),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Text('Student $index',
//                   style: const TextStyle(color: Colors.white, fontSize: 16)),
//             ),
//             _actionButton(text: 'Edit'),
//             const SizedBox(width: 8),
//             _actionButton(text: 'Delete'),
//           ],
//         ),
//       );

//   Widget _actionButton({String? text,void Function()? onPressed}) => ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.amber,
//           foregroundColor: Colors.purple,
//         ),
//         onPressed: onPressed,
//         child: Text(text??''),
//       );
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homescreen.dart';   // your dashboard screen
import 'login.dart';       // your login screen

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
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
            _actionButton(text: 'Edit'),
            const SizedBox(width: 8),
            _actionButton(text: 'Delete'),
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
