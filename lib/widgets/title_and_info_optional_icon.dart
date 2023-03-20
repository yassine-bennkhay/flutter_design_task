import 'package:flutter/material.dart';

import '../constants/colors_pallete.dart';

class TitleAndInfoIconOptional extends StatelessWidget {
  const TitleAndInfoIconOptional({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "ABCGinto",
              fontWeight: FontWeight.w500),
        ),
         Icon(
         icon,
          color: ColorPallete.alertAppBar,
        )
      ],
    );
  }
}
