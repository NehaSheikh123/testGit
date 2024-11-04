import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController c_password = TextEditingController();

  Future<void> register(BuildContext context) async{
    try{
    if(password.text != c_password.text)
   { ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Confirm Password not matched")));
    return;}
  

  UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.text, password: password.text);
  
  SharedPreferences storage = await SharedPreferences.getInstance();

  await storage.setString("user", user.user!.uid);

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: $e")));
    }

  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Padding(padding: const EdgeInsets.all(16.5),
      child: Column(children: [
        const Text("Email"),
         TextField(decoration: InputDecoration(hintText: 'Please Enter Email'), controller: email,),
        const SizedBox(height: 20,),
        const Text("Password"),
         TextField(decoration: InputDecoration(hintText: "Your Password"),controller: password,
        obscureText: true,),
        const SizedBox(height: 20,),
        const Text("Confirm Password"),
         TextField(decoration: InputDecoration(hintText: "Confirm password"), controller: c_password,
        obscureText: true,),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: () async{
          await register(context);
        }, child: const Text("Sign up"))
      ]),),
    );
  }
}