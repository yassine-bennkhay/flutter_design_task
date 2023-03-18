import 'package:flutter/material.dart';
import '../constants/sizedbox_spacer.dart';
import '../widgets/filter_slider.dart';
import '../widgets/dashboard_slider.dart';

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
  List<String> stringFilters = [
    "Daily",
    "Safety",
    "Excellent",
    "Work clothes E.P.I",
    "Bad condition",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBoxSpacer(),
        DashboardSlider(
            containerColors: containerColors,
            iconPaths: iconPaths,
            numbers: numbers,
            status: status),
        const SizedBoxSpacer(),
        FilterSlider(stringFilters: stringFilters),
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
