import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson2_custom_paint_homework/views/screens/clock_with_number.dart';
import 'package:lesson2_custom_paint_homework/views/widgets/animate_custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  DateTime _dateTime = DateTime.now();
  int _hour = DateTime.now().hour;
  int _minute = DateTime.now().minute;
  int _second = DateTime.now().second;

  @override
  void initState() {
    super.initState();

    _hour = _dateTime.hour;
    _minute = _dateTime.minute;
    _second = _dateTime.second;
    Timer.periodic(
    Duration(seconds: 1),
        (Timer timer) {
      _dateTime = DateTime.now();
      _hour = _dateTime.hour;
      _minute = _dateTime.minute;
      _second = _dateTime.second;
      setState(() {
      });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The time"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.rotate(
                angle: -pi / 2,
              child: CustomPaint(
                size: Size(200, 200),
                painter: AnimatedCustomPainter(dateTime: _dateTime),
              ),
            ),
            ClockWithNumber(
              hour: _hour,
              minute: _minute,
              second: _second,
            ),
          ],
        ),
      ),

    );
  }
}
