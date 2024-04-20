import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget addPadding(
      {double? left, double? right, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(
          left: left ?? 0,
          bottom: bottom ?? 0,
          right: right ?? 0,
          top: top ?? 0),
      child: this,
    );
  }

  Widget addPaddingAll(double? value) {
    return Padding(
      padding: EdgeInsets.all(value ?? 0),
      child: this,
    );
  }

}
