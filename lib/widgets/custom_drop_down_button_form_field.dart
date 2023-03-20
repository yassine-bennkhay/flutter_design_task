import 'package:flutter/material.dart';
import '../constants/colors_pallete.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  final List<String> options;
  final bool isTapped;
  final ValueChanged<bool> onTapped;
  String selected;
  final IconData? iconData; // add a new optional iconData parameter

  CustomDropdownButtonFormField({
    Key? key,
    required this.options,
    this.isTapped = false,
    required this.onTapped,
    required this.selected,
    this.iconData, // initialize the new parameter
  }) : super(key: key);

  @override
  _CustomDropdownButtonFormFieldState createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  bool isItTapped = false;

  @override
  void initState() {
    super.initState();
    isItTapped = widget.isTapped;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.8,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonFormField(
        value: widget.selected,
        onChanged: (option) {
          setState(() {
            widget.selected = option!;
          });
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              left: 10,
            )),
        icon: widget.iconData != null 
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(widget.iconData),
                    color: isItTapped
                        ? ColorPallete.progressColor
                        : ColorPallete.alertAppBar,
                    onPressed: () {
                      setState(() {
                        isItTapped = !isItTapped;
                      });
                      widget.onTapped(isItTapped);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5, top: 5),
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              )
            : const Icon(Icons.arrow_drop_down), 
        items: widget.options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}
