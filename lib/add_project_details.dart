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
    );
  }
}