import 'package:design_task/screens/manual_alert_screen.dart';
import 'package:design_task/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Task',

      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set your initial route here
      routes: {
        '/': (context) => const SplashScreen(),
        Routes.manualAlertRoute: (context) => const ManualAlertScreen(),
        // Add other routes here
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.manualAlertRoute:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const ManualAlertScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}
