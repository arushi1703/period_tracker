// TODO Implement this library.
import 'package:flutter/material.dart';


class TextF extends StatelessWidget {
  final String hinttext;
  final Icon prefix;

  TextF({super.key, required this.prefix, required this.hinttext});
  final unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: TextField(
          style: TextStyle(
            color: Colors.pink,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pink,
                width: 2.0,
              )
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.pink,
                  width: 2.0,
                )
            ),
            hintText: hinttext,
            prefixIcon: prefix,
          ),
        ),
      );
  }
}
