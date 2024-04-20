import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialrate/components/BottomBarView/bottom_view_model.dart';
import 'package:socialrate/extensions/bottom_bar_extension.dart';
import 'package:socialrate/views/HomeView/home_view.dart';
import 'package:socialrate/views/ProfileView/profile_view.dart';

import '../HomeView/home_view_model.dart';

class MainView extends GetView {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomeViewModel homeViewModel = Get.put(HomeViewModel());
    const homeView = HomeView();
    List<Widget> children = [
      homeView,
      Container(
        color: Colors.black,
      ),
     const ProfileView(),
    ];
    return Scaffold(body: GetX<BottombarViewModel>(
      builder: (controller) {
        return SafeArea(
          child: children[controller.selectedIndex.value],
        ).addBottomBar();
      },
    ));
  }
}
