import 'package:flutter/material.dart';

import '../components/BottomBarView/bottom_bar.dart';

extension BottomBarExtension on SafeArea {
  SafeArea addBottomBar({int? tabIndex}) {
    return SafeArea(
        child: Stack(
      children: [
        child,
        const Align(
            heightFactor: 14,
            alignment: Alignment.bottomCenter,
            child: BottomBarView()),
      ],
    ));
  }
}
