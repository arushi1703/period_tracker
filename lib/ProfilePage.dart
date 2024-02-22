// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:period_app/ProfileTextField.dart';


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
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.pink,
                    size: 150,
                  ),
                ),
              ),
                SizedBox(height: 20),
                Text(
                  'arushi3002@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 100),
                
                //TextF(prefix: Icon(Icons.person), hinttext: 'username'),
              
            ],
            ),
          ),
        ),
      ),
    );
  }
}
