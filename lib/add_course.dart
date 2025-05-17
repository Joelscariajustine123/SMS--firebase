import 'package:flutter/material.dart';
import 'package:todo_app/homescreen.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  addcourse() async{
    // await 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: InkWell(
           onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );
                },
                child: Image.asset("assets/image/logo.png"),
        ),
        backgroundColor: Colors.purple,
        title: Text("Add new course"),
      ),
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text("Course Name"),
              hintText: "Enter course name",
              prefix: Icon(Icons.school),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,foregroundColor: Colors.amber), onPressed: addcourse, child: Text("Add Course"))
        ],
      ),
    );
  }
}