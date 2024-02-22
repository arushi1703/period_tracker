// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key, required this.title});
  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

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
              TableCalendar(
                firstDay:DateTime.utc(2023,01,01),
                lastDay: DateTime.utc(2024,10,17),
                focusedDay: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
