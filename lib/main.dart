import 'package:design_task/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Design Task',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
