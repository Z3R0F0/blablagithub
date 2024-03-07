import 'package:blablagithub/constants/app_colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

BoxDecoration neumorph(bool pressed, Color color) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color,
      boxShadow: [
        BoxShadow(
          blurRadius: pressed ? 5.0 : 8.0,
          color: MyColors.backgroundPrimaryLight,
          offset: -(pressed ? const Offset(10, 10) : const Offset(-1, -1)),
          inset: pressed,
        ),
        BoxShadow(
          blurRadius: pressed ? 5.0 : 10.0,
          color: MyColors.backgroundPrimary,
          offset: -(pressed ? const Offset(10, 10) : const Offset(15, 15)),
          inset: pressed,
        ),
      ]);
}
