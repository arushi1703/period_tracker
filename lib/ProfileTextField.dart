// TODO Implement this library.
import 'package:flutter/material.dart';


class TextF extends StatelessWidget {
  final String hinttext;
  final Icon prefix;

  TextF({super.key, required this.prefix, required this.hinttext});


  final unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: TextField(
          style: TextStyle(
            color: Colors.black45,
          ),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black45,
                width: 2.0,
              )
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                )
            ),
            hintText: hinttext,
            prefixIcon: prefix,
          ),

        ),



      ),
    );
  }
}
