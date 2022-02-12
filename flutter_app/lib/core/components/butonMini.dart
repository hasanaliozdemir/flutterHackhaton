// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../colors.dart';

// ignore: must_be_immutable
class ButtonMini extends StatelessWidget {
  Color? textColor;
  Color? color;
  String? text;
  VoidCallback? onPressed;

  ButtonMini.active({required String text, required VoidCallback onPressed}) {
    this.text = text;
    this.color = blue500;
    this.textColor = white;
    this.onPressed = onPressed;
  }

  ButtonMini.passive({required String text, required VoidCallback onPressed}) {
    this.text = text;
    this.color = gray400;
    this.textColor = gray800;
    this.onPressed = onPressed;
  }

  ButtonMini.backHover({required String text, required VoidCallback onPressed}) {
    this.text = text;
    this.color = blue300;
    this.textColor = white;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Container(
          width: Get.width/375* 147,
          height: Get.height/812 *56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 17,
          ),
          child:Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 17,
                fontFamily: "SF Pro Text",
                fontWeight: FontWeight.w600,
              ),
            ),
        ));
  }
}
