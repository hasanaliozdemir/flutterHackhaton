import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/colors.dart';

class TargetQuestionCard extends StatelessWidget {
  const TargetQuestionCard({
    Key? key,
    required this.solved,
    required this.target,
  }) : super(key: key);

  final int solved;
  final int target;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: blue700.withOpacity(0.6),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            height: 68,
            width: 232,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Çözülen Soru",style: TextStyle(fontSize: 24,color: Colors.white),),
                    const Spacer(),
                    Text("$solved",style: const TextStyle(fontSize: 24,color: Colors.white),),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    const Text("Hedef Soru",style: TextStyle(fontSize: 24,color: Colors.white),),
                    const Spacer(),
                    Text("$target",style: const TextStyle(fontSize: 24,color: Colors.white),),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 90,
            width: 80,
            child: CircularPercentIndicator(
              radius: 40,
              lineWidth: 13,
              percent: solved/target,
              center: Text("${solved/target*100}%",style: TextStyle(fontSize: 16),),
          progressColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
