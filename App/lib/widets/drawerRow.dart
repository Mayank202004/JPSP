import 'package:flutter/material.dart';
import 'package:jpss/models/menuItem.dart';
import 'package:rive/rive.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow({super.key, required this.menu});

  final MenuItem menu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          //child: RiveAnimation.asset(),
        )
      ],
    );
  }
}
