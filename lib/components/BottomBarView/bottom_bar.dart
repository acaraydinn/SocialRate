import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:socialrate/apps_constants.dart';
import 'package:socialrate/components/BottomBarView/bottom_view_model.dart';
import 'package:socialrate/extensions/widget_extension.dart';

class BottomBarView extends GetView<BottombarViewModel> {
  const BottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var boxDecoration = const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 14, offset: Offset(0, -1))
        ],
        color: SRColors.white,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10), top: Radius.circular(25)));

    return Container(
      decoration: boxDecoration,
      height: 55,
      width: size.width - 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTabItem(icon: Elusive.home, tabIndex: 0),
          buildTabItem(icon: Elusive.search, tabIndex: 1),
          buildTabItem(icon: Elusive.adult, tabIndex: 2)
        ],
      ),
    );
  }

  Widget buildTabItem({required IconData icon, required int tabIndex}) {
    return Obx(() => Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: controller.selectedIndex.value == tabIndex ? 15 : 0,
            child: IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {
                  controller.selectTab(tabIndex);
                },
                icon: Icon(icon)))
        .addPadding(top: 3, bottom: 3));
  }
}
