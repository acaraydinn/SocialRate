import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialrate/extensions/widget_extension.dart';
import 'package:socialrate/views/HomeView/home_view_model.dart';
import '../../components/AppBarView/appbar_view.dart';
import 'post_card.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SRAppBar(),
        body: SafeArea(
            child: Obx(
          () => ListView.builder(
            itemCount: controller.postCount.value,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              return SRPostCard(
                post: controller.comments.results![index],
              ).addPadding(left: 16, right: 16, top: 20);
            },
          ),
        )));
  }
}


