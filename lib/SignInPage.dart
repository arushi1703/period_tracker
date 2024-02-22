// TODO Implement this library.
import 'package:flutter/material.dart';
import 'WelcomePage.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});
  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final unameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text(widget.title),
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/appbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child:Text(
                  'Welcome Back!',
                  style:TextStyle(
                    fontSize: 30,
                    color: Colors.pink[400],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.account_circle_sharp,
                  size: 50,
                  color: Colors.pink[300],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: unameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter valid username'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.pink, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[300],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => WelcomePage(title: unameController.text)));
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpPage(title:'SignUp')));
                },
                child: Text(
                  'New User? Create Account',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
