import 'package:flutter/material.dart';

class ClockWithNumber extends StatelessWidget {
  final int hour;
  final int minute;
  final int second;
  final double textSize;
  final Color backgroundColor;
  final Color textColor;

  const ClockWithNumber({
    super.key,
    required this.hour,
    required this.minute,
    required this.second,
    this.textSize = 40.0,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.yellow,
          width: 3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${timeFormatter(hour)}:${timeFormatter(minute)}",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 40, // Changed size for colon
            ),
          ),
          Text(
            timeFormatter(second),
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        ],
      ),
    );
  }

  String timeFormatter(int formatTime) {
    if (formatTime <= 9) {
      return '0$formatTime';
    }
    return '$formatTime';
  }
}
