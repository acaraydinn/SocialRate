import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:socialrate/components/AppBarView/appbar_view.dart';
import 'package:socialrate/views/ProfileView/profile_view_model.dart';

import '../../apps_constants.dart';

class ProfileView extends GetView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: const SRAppBar(),
        body: ListView(
          children: [
            Card(
              child: Row(
                children: [
                  CircleAvatar(
                    child: controller.profileResponse.value.photoUrl != null
                        ? Image.network(
                            controller.profileResponse.value.photoUrl)
                        : Image.asset(logo),
                  ),
                  Text("Takipçi"),
                  Text("Rating"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
