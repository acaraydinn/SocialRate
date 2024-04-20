import 'package:flutter/material.dart';
import 'package:socialrate/extensions/text_extension.dart';

class SRAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;

  const SRAppBar({
    super.key,
    this.height = kToolbarHeight,
  });

  @override
  _SRAppBarState createState() => _SRAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _SRAppBarState extends State<SRAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("SocialRate").toSharpGroteskMedium20(),
    );
  }
}
