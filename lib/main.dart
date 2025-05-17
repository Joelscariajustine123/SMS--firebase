import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:todo_app/list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/list.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        canvasColor: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return Listview();
          }
          else{
            return const MyHomePage(title: 'Todo');
          }
        }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailctr=TextEditingController();
  var passwordctr=TextEditingController();
  login() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailctr.text.trim(), password: passwordctr.text.trim());
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.title),
        leading: Icon(Icons.person),
        
      ),
      backgroundColor: Colors.amber,
      body: Center(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            TextField(
              controller: emailctr,
              decoration: InputDecoration(
                prefix: Icon(Icons.email),
                label: Text("Email"),
                hintText: "Enter your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurpleAccent)
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordctr,
              decoration: InputDecoration(
                prefix: Icon(Icons.password),
                label: Text("Password"),
                hintText: "Enter your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurpleAccent)
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: login
            // (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Listview()),);
            // } 
            , child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
