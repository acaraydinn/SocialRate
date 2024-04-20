import 'package:flutter/material.dart';

// Özel bir sınıf oluşturun
class CustomText extends StatelessWidget {
  final String data;
  final TextStyle style;

  const CustomText(this.data, this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    // Text widget'ını burada kullanın
    return Text(data, style: style);
  }
}

// Extension method'u tanımlayın
extension CustomTextExtension on Text {
  CustomText toSharpGroteskBook20() {
    TextStyle customstyle = style ?? const TextStyle();
    TextStyle customStyle = customstyle.copyWith(
      fontFamily: 'Sharp Grotesk Book20',
    );
    // Yeni CustomText widget'ını oluşturup döndürün
    return CustomText(data!, customStyle);
  }

  CustomText toSharpGroteskMedium20() {
    TextStyle customStyle = const TextStyle(
      fontFamily: 'Sharp Grotesk Medium20',
    );
    // Yeni CustomText widget'ını oluşturup döndürün
    return CustomText(data!, customStyle);
  }

  CustomText toSharpGroteskSemiBold20() {
    TextStyle customStyle = const TextStyle(
      fontFamily: 'Sharp Grotesk SemiBold20',
    );
    // Yeni CustomText widget'ını oluşturup döndürün
    return CustomText(data!, customStyle);
  }
}

String loremipsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
