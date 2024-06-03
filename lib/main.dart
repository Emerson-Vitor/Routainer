import 'package:autoscript/pages/home_page.dart';
import 'package:autoscript/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto-script',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1A2834),
        brightness: Brightness.dark,
        background:  Color(0xFF1A2834),

      ),),
      home: Home_page(),
    );
  }
}