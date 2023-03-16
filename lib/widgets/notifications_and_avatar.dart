import 'package:flutter/material.dart';
import '../constants/colors_pallete.dart';

List<Widget> notificationsAndAvatar() {
  return const [
    Icon(
      Icons.notifications,
      color: ColorPallete.fontsColor,
      size: 30,
    ),
    SizedBox(
      width: 10,
    ),
    Padding(
      padding: EdgeInsets.only(right: 10, bottom: 6),
      child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/yassine_bennkhay.png")),
    ),
  ];
}
