import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_application_1/api_test.dart';
import 'package:flutter_application_1/Map.dart';
// import 'package:flutter_application_1/home.dart';
// import 'package:flutter_application_1/signup.dart';
// import 'package:flutter_application_1/auth.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MaterialApp(
  // home: Auth()
 // home: ApiTest(),
 home: Map(),
));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home: const Home(),
//       // home: const Signup(),
//       home: const Login(),
//     );
//   }
// }

