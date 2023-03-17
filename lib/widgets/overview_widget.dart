import 'package:flutter/material.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  List<String> iconPaths = [
    "assets/images/observation_icon.png",
    "assets/images/pending_icon.png",
    "assets/images/progress.png",
    "assets/images/resolved_icon.png",
    "assets/images/hide.png",
  ];
  List<Color> containerColors = [
    const Color(0xffD4EFFF),
    const Color(0xffD4EFFF),
    const Color(0xffFFEDAA),
    const Color(0xffBFFFC9),
    const Color(0xffE9E9E9)
  ];
  List<String> status = [
    "My observations",
    "Pending",
    "Progress",
    "Resolved",
    "Closed",
  ];
  List<int> numbers = [
    150,
    4,
    1,
    2,
    1,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Container(
                  width: 220,
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
        )
      ]),
    );
  }
}

class NumberAndStatus extends StatelessWidget {
  const NumberAndStatus({
    Key? key,
    required this.numbers,
    required this.status,
    required this.index,
  }) : super(key: key);

  final List<int> numbers;
  final List<String> status;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          numbers[index].toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          status[index],
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
