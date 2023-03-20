import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final List<int>? selectedValues;

  const NumberPicker({
    Key? key,
    required this.minValue,
    required this.maxValue,
    this.selectedValues,
  }) : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  final double _itemWidth = 50.0;

  final double _horizontalPadding = 16.0;

  late ScrollController _scrollController;
  late List<int> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = widget.selectedValues ?? [widget.minValue];
    _scrollController = ScrollController(
      initialScrollOffset: _selectedValues[0] * _itemWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: () {
              _scrollTo(_selectedValues[0] - 1);
            },
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: widget.maxValue - widget.minValue + 1,
              itemBuilder: (context, index) {
                final value = index + widget.minValue;
                final isSelected = _selectedValues.contains(value);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedValues.remove(value);
                      } else {
                        _selectedValues.add(value);
                      }
                      _selectedValues.sort();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    width: _itemWidth,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.8,
                        style: BorderStyle.solid,
                      ),
                      color:
                          isSelected ? const Color(0xff5F4BA3) : Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        '$value',
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 4.0),
          IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: () {
              _scrollTo(_selectedValues.last + 1);
            },
          ),
        ],
      ),
    );
  }

  void _scrollTo(int value) {
    if (value < widget.minValue || value > widget.maxValue) return;
    final index = value - widget.minValue;
    _scrollController.animateTo(
      index * _itemWidth,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
