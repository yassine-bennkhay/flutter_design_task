import 'package:design_task/widgets/toggleable_row.dart';
import 'package:flutter/material.dart';
import '../constants/colors_pallete.dart';
import '../widgets/custom_drop_down_button_form_field.dart';
import '../widgets/number_selector.dart';
import '../widgets/title_and_add_button.dart';
import '../widgets/title_and_info_optional_icon.dart';

class ManualAlertScreen extends StatefulWidget {
  const ManualAlertScreen({Key? key});

  @override
  State<ManualAlertScreen> createState() => _ManualAlertScreenState();
}

class _ManualAlertScreenState extends State<ManualAlertScreen> {
  List<String> sites = ['Site 001', 'Site 002', 'Site 003'];
  List<String> zones = ['Zone 001', 'Zone 002', 'Zone 003'];
  List<String> rooms = ['Room 001', 'Room 002', 'Room 003'];
  List<String> periods = ['30 Minutes', '60 Minutes', '120 Minutes'];
  bool isSiteBookMarkClicked = false;
  bool isZoneBookMarkClicked = false;

  @override
  Widget build(BuildContext context) {
    String? selectedSite = sites[0];
    String? selectedZone = zones[0];
    String? selectedRoom = rooms[0];
    String? selectedPeriod = periods[0];

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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      const TitleAndInfoIconOptional(
                        title: "Site",
                        icon: Icons.info,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropdownButtonFormField(
                        options: sites,
                        isTapped: isSiteBookMarkClicked,
                        onTapped: (bool status) {
                          isSiteBookMarkClicked = status;
                        },
                        selected: selectedSite,
                        iconData: Icons.bookmark,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TitleAndInfoIconOptional(
                        title: "Zone",
                        icon: Icons.info,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropdownButtonFormField(
                        options: zones,
                        isTapped: isZoneBookMarkClicked,
                        onTapped: (bool status) {
                          isZoneBookMarkClicked = status;
                        },
                        selected: selectedZone,
                        iconData: Icons.bookmark,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TitleAndInfoIconOptional(
                        title: "Level",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const NumberPicker(
                        minValue: -2,
                        maxValue: 10,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TitleAndInfoIconOptional(
                        title: "Location",
                      ),
                      const ToggleRow(
                        leftLabel: "Room",
                        rightLabel: "Equipment",
                      ),
                      const TitleAndAddButton(
                        title: "Room",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropdownButtonFormField(
                        options: rooms,
                        isTapped: isZoneBookMarkClicked,
                        onTapped: (bool status) {
                          isZoneBookMarkClicked = status;
                        },
                        selected: selectedRoom,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TitleAndInfoIconOptional(
                        title: "Position",
                        icon: Icons.info,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const ToggleRow(
                        leftLabel: "Inside",
                        rightLabel: "Outside",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TitleAndInfoIconOptional(
                        title: "Time expected to complete the job",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropdownButtonFormField(
                        options: periods,
                        isTapped: isZoneBookMarkClicked,
                        onTapped: (bool status) {
                          isZoneBookMarkClicked = status;
                        },
                        selected: selectedPeriod,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 25, top: 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff25A5DC),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/send.png"),
                      const SizedBox(width: 10),
                      const Text(
                        "Send Alert",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
