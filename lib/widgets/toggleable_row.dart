import 'package:flutter/material.dart';

class ToggleRow extends StatefulWidget {
  final String leftLabel;
  final String rightLabel;

  const ToggleRow({Key? key, required this.leftLabel, required this.rightLabel}) : super(key: key);

  @override
  _ToggleRowState createState() => _ToggleRowState();
}

class _ToggleRowState extends State<ToggleRow> {
  bool _isLeftSelected = true;

  @override
  Widget build(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width - (2 * 25);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isLeftSelected = true;
            });
          },
          child: Container(
            width: availableWidth / 2,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isLeftSelected ? const Color(0xff5F4BA3) : Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Text(
              widget.leftLabel,
              style: TextStyle(
                color: _isLeftSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isLeftSelected = false;
            });
          },
          child: Container(
            width: availableWidth / 2,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  !_isLeftSelected ? const Color(0xff5F4BA3) : Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Text(
              widget.rightLabel,
              style: TextStyle(
                color: !_isLeftSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
