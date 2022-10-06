import 'package:cuostam_navigationbar/PAGE/fivescreen.dart';
import 'package:cuostam_navigationbar/PAGE/onescreen.dart';
import 'package:cuostam_navigationbar/PAGE/threescreen.dart';
import 'package:cuostam_navigationbar/PAGE/twoscreen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../PAGE/fourscreen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        body: Center(
            child: [One(), two(), Three(), Four(), Five()]
                .elementAt(controller.selectedIndex.value)),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(200)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getBottemIcon(title: "home", icon: Icons.home, index: 0),
                getBottemIcon(
                    title: "Search", icon: Icons.search_rounded, index: 1),
                getBottemIcon(
                    title: "Persen", icon: Icons.account_box, index: 2),
                getBottemIcon(title: "add", icon: Icons.add, index: 3),
                getBottemIcon(title: "Setting", icon: Icons.settings, index: 4),
              ],
            )),
          ),
        ),
      );
    });
  }

  Widget getBottemIcon(
      {IconData icon = Icons.add, String title = "Add", int index = 0}) {
    return InkWell(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: (controller.selectedIndex.value == index)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          : Icon(
              icon,
              color: (controller.selectedIndex.value == index)
                  ? Colors.yellow
                  : Colors.white,
              size: 30,
            ),
    );
  }
}
