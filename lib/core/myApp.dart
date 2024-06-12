import 'package:autoscript/modulos/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto-script',
      theme: ThemeData(
        textTheme: TextTheme(bodyLarge: TextStyle(fontFamily: 'RobotoMono')),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF1A2834),
          brightness: Brightness.dark,
          background: Color(0xFF1A2834),
        ),
      ),
      home: Home_page(),
    );
  }
}