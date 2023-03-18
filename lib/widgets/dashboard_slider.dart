import '../widgets/overview_widget.dart';
import 'package:flutter/material.dart';

class DashboardSlider extends StatelessWidget {
  const DashboardSlider({
    Key? key,
    required this.containerColors,
    required this.iconPaths,
    required this.numbers,
    required this.status,
  }) : super(key: key);

  final List<Color> containerColors;
  final List<String> iconPaths;
  final List<int> numbers;
  final List<String> status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              width: 220 * MediaQuery.of(context).size.width / 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: containerColors[index],
                      ),
                      child: Center(
                        child: Image.asset(
                          iconPaths[index],
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  NumberAndStatus(
                    numbers: numbers,
                    status: status,
                    index: index,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
