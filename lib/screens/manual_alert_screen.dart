import 'package:flutter/material.dart';

import '../constants/colors_pallete.dart';

class ManualAlertScreen extends StatefulWidget {
  const ManualAlertScreen({super.key});

  @override
  State<ManualAlertScreen> createState() => _ManualAlertScreenState();
}

class _ManualAlertScreenState extends State<ManualAlertScreen> {
  List<String> options = ['Site 001', 'Site 002', 'Site 003'];
  bool isItTapped = false;
  @override
  Widget build(BuildContext context) {
    String? selectedOption = options[0];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset("assets/icons/arrow_back.png"),
        ),
        backgroundColor: ColorPallete.alertAppBar,
        shadowColor: ColorPallete.fontsColor.withOpacity(0.01),
        title: const Text(
          "Manual Alert",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Site",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "ABCGinto",
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.info,
                  color: ColorPallete.alertAppBar,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.8,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton(
                value: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                isExpanded: true,
                itemHeight: null,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8.0),
                    IconButton(
                      icon: const Icon(Icons.bookmark),
                      color: isItTapped
                          ? ColorPallete.progressColor
                          : ColorPallete.alertAppBar,
                      onPressed: () {
                        setState(() {
                          isItTapped = !isItTapped;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
                items: options.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(option),
                    ),
                  );
                }).toList(),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
