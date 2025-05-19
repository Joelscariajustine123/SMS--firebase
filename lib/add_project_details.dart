import 'package:flutter/material.dart';
import 'package:todo_app/homescreen.dart';

class AddProjectDetails extends StatefulWidget {
  const AddProjectDetails({super.key});

  @override
  State<AddProjectDetails> createState() => _AddProjectDetailsState();
}

class _AddProjectDetailsState extends State<AddProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,
      title: Text("Add Project Details"),
      leading:InkWell(onTap: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Homescreen()),);}, 
      child:  Image.asset('assets/image/logo.png'))),
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
                label: Text("Student Name"),
                hintText: "Select Student",
                suffix: Icon(Icons.arrow_drop_down),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
               label: Text("Project 1"),
                hintText: "Enter Project 1",
                suffix: Icon(Icons.arrow_drop_down),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
                label: Text("Project 2"),
                hintText: "Enter Project 2",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
                label: Text("Project 3"),
                hintText: "Enter Project 3",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
             TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
                label: Text("Project 4"),
                hintText: "Enter Project 4",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
                label: Text("Project 5"),
                hintText: "Enter Project 5",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                prefix: Icon(Icons.person),
                label: Text("Project 6"),
                hintText: "Enter Project 6",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (_)=> Homescreen()));
            }, child: Text("Add Projects",
            style: TextStyle(color: Colors.amber),),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),)
          ],
        ),
      ),
    );
  }
}