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
        color: blue500.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Center(child: Text("Soru Çöz",style: TextStyle(
              color: blue500
            ),)),
          ),
          const SizedBox(width: 32,),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Center(child: Text("Konu Dinle",style: TextStyle(
              color: blue500
            ),)),
          ),
        ],
      ),
    );
  }
}