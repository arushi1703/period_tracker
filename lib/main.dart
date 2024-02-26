import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main() {
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
      home: const MyHomePage(title: 'Arushi app'),
    );
  }
}

