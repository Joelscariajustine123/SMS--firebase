import 'package:flutter/material.dart';
import 'package:todo_app/homescreen.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (_) =>const Homescreen()));
          },
          child: Image.asset("assets/image/logo.png"),
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (_) =>const Homescreen()));
          },
          child: Text("Project Details")
        ),

      ),
      backgroundColor: Colors.amber,
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
              padding: EdgeInsets.only(left:10,top: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              child: Text("Name:",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30
              ),),
            ),
            SizedBox(height: 20,), Container(
              padding: EdgeInsets.only(left:10,top: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              child: Text("Project1: ",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30
              ),),
            ),
            SizedBox(height: 20,), Container(
              padding: EdgeInsets.only(left:10,top: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              child: Text("Project2",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30
              ),),
            ),
            SizedBox(height: 20,),
             Container(
              padding: EdgeInsets.only(left:10,top: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
              child: Text("Project3",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30
              ),),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}