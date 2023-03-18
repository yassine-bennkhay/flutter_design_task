import 'package:design_task/constants/colors_pallete.dart';
import 'package:design_task/screens/manual_alert_screen.dart';
import 'package:design_task/widgets/notifications_and_avatar.dart';
import 'package:design_task/widgets/overview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../widgets/custom_page_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic selected;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: ColorPallete.fontsColor.withOpacity(0.01),
        title: const Text(
          "Overview",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "ABCGinto",
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: ColorPallete.whiteColor,
        actions: notificationsAndAvatar(),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xffF2F2F2),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: const <Widget>[
              OverviewWidget(),
              Center(child: Text('Search')),
              Center(child: Text('Watch')),
              Center(child: Text('Gallery')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: getNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, CustomPageRoute(page: const ManualAlertScreen()));
        },
        backgroundColor: ColorPallete.secondaryColor,
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  StylishBottomBar getNavBar() {
    return StylishBottomBar(
      items: [
        BottomBarItem(
            icon: const Icon(Icons.dashboard),
            selectedIcon: const Icon(Icons.dashboard),
            selectedColor: ColorPallete.secondaryColor,
            title: const Text('Home')),
        BottomBarItem(
            icon: const Icon(Icons.search),
            selectedIcon: const Icon(Icons.search_outlined),
            selectedColor: ColorPallete.secondaryColor,
            title: const Text('Search')),
        BottomBarItem(
            icon: const Icon(
              Icons.remove_red_eye_outlined,
            ),
            selectedIcon: const Icon(
              Icons.style,
            ),
            selectedColor: ColorPallete.secondaryColor,
            title: const Text('Observations')),
        BottomBarItem(
            icon: const Icon(
              Icons.image,
            ),
            selectedIcon: const Icon(
              Icons.image,
            ),
            selectedColor: ColorPallete.secondaryColor,
            title: const Text('Gallery')),
      ],
      hasNotch: true,
      currentIndex: selected ?? 0,
      onTap: (index) {
        controller.jumpToPage(index);
        setState(() {
          selected = index;
        });
      },
      fabLocation: StylishBarFabLocation.center,
      option: AnimatedBarOptions(
        // iconSize: 32,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.animated,
        // opacity: 0.3,
      ),
    );
  }
}
