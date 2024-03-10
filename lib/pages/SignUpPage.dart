// TODO Implement this library.
import 'package:flutter/material.dart';
import 'SignInPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey=GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text("Sign Up"),
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child:Text(
                    'Create your account!',
                    style:TextStyle(
                      fontSize: 30,
                      color: Colors.pink[400],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'abcd@gmail.com'
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:(email)=>
                        email!=null && !EmailValidator.validate(email)?"Enter valid email":null,
                  ),
                ),
                /*Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: '6-12 characters'
                    ),
                  ),
                ),*/
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Create Password',
                        hintText: '6-12 characters including special symbols',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password)=>
                    password!=null && password.length<6?"Enter min 6 characters":null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:(password)=>
                      password!=null && password.length<6?"Enter min 6 characters":null,
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
                    onPressed: (){
                      signUp();
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(height:50),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignInPage()));
                  },
                  child: Text(
                    'Already have an account?   Login',
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
      ),
    );
  }
  Future signUp() async{
    final isValid=formKey.currentState!.validate();
    if (!isValid) return;

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
    }on FirebaseAuthException catch(e){
      print(e);
    }
  }
}
