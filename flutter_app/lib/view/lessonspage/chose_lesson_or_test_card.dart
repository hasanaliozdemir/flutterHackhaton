import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';

class ChoseLessonOrTestCard extends StatelessWidget {
  const ChoseLessonOrTestCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        //color: blue500.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            decoration: BoxDecoration(
                color: white.withOpacity(1),
                boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
                borderRadius: BorderRadius.circular(16)),
            child: Align(
                alignment: Alignment.topCenter,
                child: TextLiquidFill(
                  text: "Soru Çöz ve Konu Öğren",
                  loadDuration: Duration(seconds: 1),
                  waveColor: blue400,
                  boxBackgroundColor: white,
                  textStyle: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 70.0,
                  waveDuration: Duration(seconds: 1),
                  loadUntil: 1,
                )),
          ),
        ],
      ),
    );
  }
}
