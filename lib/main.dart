import 'package:flutter/material.dart';
import 'package:lesson2_custom_paint_homework/views/screens/home_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}
