import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const String logo = "assets/images/srlogo.png";
SizedBox spacer({double? width, double? height}) =>
    SizedBox(height: height, width: width);
Widget makeButton(
        {Function()? onPressed,
        String? text,
        Color? backgroundColor,
        Color? textcolor}) =>
    ButtonTheme(
      height: 42,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(color: SRColors.black))),
          minimumSize:
              const MaterialStatePropertyAll<Size>(Size.fromHeight(42)),
          elevation: MaterialStateProperty.all<double>(5),
          backgroundColor: backgroundColor != null
              ? MaterialStateProperty.all<Color>(backgroundColor)
              : MaterialStateProperty.all<Color>(SRColors.mediumGray),
        ),
        child: Center(
          child: Text(text ?? "",
              style: TextStyle(color: textcolor ?? Colors.white)),
        ),
      ),
    );

class SRColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFBFBFBF);
  static const Color mediumGray = Color(0xFF7F7F7F);
  static const Color darkGray = Color(0xFF404040);
  static const Color black = Color(0xFF000000);
}
final box = GetStorage();