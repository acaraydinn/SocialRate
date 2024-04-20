import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AlertController {
  var body = 5;
  show({required String body, Function()? action}) {
    Get.defaultDialog(
        middleText: body,
        barrierDismissible: false,
        title: "!",
        onConfirm: action ?? () => Get.back(),
        textConfirm: "Tamam");
  }

  showLoader() {
    Get.dialog(
        Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: Colors.black,
            size: 100,
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0.5));
  }

  dismissLoader() {
    Get.back();
  }
}
