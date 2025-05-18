import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   var passwordctr=TextEditingController(text:"a@123456");
  var emailctr = TextEditingController( text: "joelscaria2002@gmail.com");
  bool _isObscure = true;
  login() async{
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailctr.text.trim(), password: passwordctr.text.trim());
   }on FirebaseAuthException catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${e.message}')));
   }

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
  appBar: AppBar(
    leading: Image.asset("assets/image/logo.png"),
    backgroundColor: Colors.purple,
    title: Text("Login"),
  ),
  body: Container(
    width: double.infinity,
    color: Colors.amber,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: emailctr,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: "Email",
            hintText: "Enter your Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: passwordctr,
           obscureText: _isObscure, 
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: const Color.fromARGB(255, 4, 4, 4),
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
            labelText: "Password",
            hintText: "Enter your Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: login,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.amber,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: Text("Login"),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: "Signup"),
              ),
            );
          },
          child: Text(
            "Don't have an account? Register",
            style: TextStyle(
              color: Colors.deepPurple,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}