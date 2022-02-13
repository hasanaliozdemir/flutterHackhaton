import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../core/colors.dart';

class SenQuestionCard extends StatelessWidget {
  const SenQuestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: blue600.withOpacity(0.6)),
      child: Center(
        child: Container(
          height: 140,
          width: 320,
          decoration: BoxDecoration(
              color: white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Sorunu Gönder",
                      style: TextStyle(
                          color: blue500,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Lottie.asset("assets/lottie/lt2.json"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
