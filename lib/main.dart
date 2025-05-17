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
            return const MyHomePage(title: 'Slot Management System');
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
  var usernamectr = TextEditingController();
  var confirmPasswordctr = TextEditingController();

  // register() async{
  //   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailctr.text.trim(), password: passwordctr.text.trim());
  // }
  register() async {
  final email = emailctr.text.trim();
  final password = passwordctr.text.trim();
  final username = usernamectr.text.trim(); // <- define this controller
  final confirmPassword = confirmPasswordctr.text.trim(); // <- define this too

  final usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,30}$');
  final emailRegExp = RegExp(r'^[\w\.-]+@[\w\.-]+\.[A-Za-z]{2,}$');

  // Field validations
  if (email.isEmpty || password.isEmpty || username.isEmpty || confirmPassword.isEmpty) {
    showError("All fields are required");
    return;
  }

  if (!emailRegExp.hasMatch(email)) {
    showError("Enter a valid email");
    return;
  }

  if (!usernameRegExp.hasMatch(username)) {
    showError("Username can only contain letters, numbers, underscores (3-30 chars)");
    return;
  }

  if (password != confirmPassword) {
    showError("Passwords do not match");
    return;
  }

  if (password.length < 6) {
    showError("Password must be at least 6 characters long");
    return;
  }

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // You can save username to Firestore or Realtime Database here if needed
    // Example:
    // await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({'username': username});

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Listview()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      showError("Email already in use");
    } else {
      showError("Registration error: ${e.message}");
    }
  } catch (e) {
    showError("Something went wrong");
  }
}

void showError(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
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
      body: Expanded(
        child: Center(
          
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
                controller: usernamectr,
                decoration: InputDecoration(
                  prefix: Icon(Icons.person),
                  label: Text("Username"),
                  hintText: "Enter your Username",
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
              TextField(
                controller: confirmPasswordctr   ,
                decoration: InputDecoration(
                  prefix: Icon(Icons.password),
                  label: Text("Re-type password"),
                  hintText: "Enter same password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.deepPurpleAccent)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: register
              // (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Listview()),);
              // } 
              , child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
