import 'package:flutter/material.dart';

class TitleAndAddButton extends StatelessWidget {
  const TitleAndAddButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

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
        TextButton(onPressed: () {}, child: const Text("+ add")),
      ],
    );
  }
}
