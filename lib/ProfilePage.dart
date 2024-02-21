// TODO Implement this library.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Period Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.pink[100],
        useMaterial3: true,
      ),
      home: const ProfilePage(title: 'Arushi app'),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final unameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[500],
        title: Text(widget.title),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/profilebg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.pink,
                    size: 170,
                  ),
                ),
              ),
                Container(

                ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
