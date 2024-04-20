import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:socialrate/extensions/text_extension.dart';
import 'package:socialrate/extensions/widget_extension.dart';
import 'package:socialrate/views/HomeView/home_view_model.dart';

import '../../apps_constants.dart';
import 'models/comments_response.dart';

class SRPostCard extends StatelessWidget {
  final Result post;
  SRPostCard({
    super.key,
    required this.post,
  });
  HomeViewModel _homeViewModel = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: 2,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 32,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      post.user!.photoUrl ?? ""
                    )  ,
                  ).addPaddingAll(10),
                  Text(
                    "${post.user!.firstName} ${post.user!.lastName}",
                    style: const TextStyle(
                        fontFamily: "Sharp Grotesk Medium20",
                        fontStyle: FontStyle.normal),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        logo,
                        height: 26,
                      ),
                      const Text(
                        "5.0",
                        style: TextStyle(
                          height: 24,
                        ),
                        textAlign: TextAlign.center,
                      ).toSharpGroteskMedium20().addPadding(left: 3),
                    ],
                  ).addPadding(left: 12)
                ],
              ).addPadding(right: 12),
              Text(post.comment ?? "")
                  .toSharpGroteskBook20()
                  .addPadding(left: 12, right: 12, bottom: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildUpDownWidget(false, post.up ?? 0),
                  buildUpDownWidget(true, post.down ?? 0)
                ],
              )
            ],
          )),
    );
  }

  IconButton buildUpDownWidget(bool rotate, int count) {
    bool isBigValue = count > 999;
    bool visible = count > 0;
    return IconButton(
        tooltip: isBigValue ? count.toString() : null,
        onPressed: () {
          _homeViewModel.setEvulation(
              commentID: post.id ?? -1, userID: "post.user", evlulation: '');
        },
        icon: Column(
          children: [
            RotatedBox(
              quarterTurns: rotate ? 2 : 0,
              child: const Icon(
                EvilIcons.like,
                size: 25,
              ),
            ),
            Visibility(
                visible: visible,
                child: Text(
                  isBigValue ? "999+" : count.toString(),
                  style: const TextStyle(fontSize: 10),
                ).toSharpGroteskBook20())
          ],
        ));
  }
}
