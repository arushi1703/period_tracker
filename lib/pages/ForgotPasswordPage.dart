import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey=GlobalKey<FormState>();
  final emailController= TextEditingController();

  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar:AppBar(
      backgroundColor: Colors.pink[300],
      title:const Text("Reset Password"),
    ),
    body: Padding(
      padding:const EdgeInsets.all(16),
      child:Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'Receive an email to reset password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height:20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email)=>
                  email!=null && !EmailValidator.validate(email)?"Enter valid email":null,
            ),
            const SizedBox(height:20),
            ElevatedButton(
              onPressed: () async {
                await resetPassword();
                showAlertDialog(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    ),
  );

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    } catch(e){
      print("Error: $e");
    }
  }

  void showAlertDialog(BuildContext context){
    Widget okButton = FloatingActionButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Done"),
      content: Text(
          "You will receive a mail on ${emailController.text}, please update your password"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
