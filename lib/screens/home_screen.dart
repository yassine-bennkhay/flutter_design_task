import 'package:design_task/constants/colors_pallete.dart';
import 'package:design_task/widgets/notifications_and_avatar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: ColorPallete.fontsColor.withOpacity(0.2),
        title: const Text(
          "Overview",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: ColorPallete.whiteColor,
        actions: notificationsAndAvatar(),
      ),
      body: const Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
