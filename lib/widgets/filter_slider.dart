import 'package:flutter/material.dart';

class FilterSlider extends StatelessWidget {
  const FilterSlider({
    Key? key,
    required this.stringFilters,
  }) : super(key: key);

  final List<String> stringFilters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35 * MediaQuery.of(context).size.height / 800,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(stringFilters[index])),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
