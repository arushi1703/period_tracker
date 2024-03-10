import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages/MyHomePage.dart';
import 'pages/SignInPage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBVyKq5IK4Mr3lauIep6e7s3SzMWy6pzdE",
          appId: "1:782850045185:android:3f99fae483151f518b1700",
          messagingSenderId: "782850045185",
          projectId: "periodtracker-e847a"
        //options: DefaultFirebaseOptions.currentPlatform,
      ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Period Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.pink[100],
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            return MyHomePage();
          }
          else{
            return SignInPage();
          }
        }
      ),
    );
  }
}


