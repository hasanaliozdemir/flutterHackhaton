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
            height: 40,
            decoration: BoxDecoration(
              color: white.withOpacity(0),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Align(
              alignment: Alignment.topCenter,

              child: AnimatedTextKit(animatedTexts: [
            WavyAnimatedText("Soru Çöz ve Konu Dinle",textStyle: TextStyle(
                color: blue500,
                fontSize: 30,
              ),)
          ] )
            ),
          ),
          
        ],
      ),
    );
  }
}