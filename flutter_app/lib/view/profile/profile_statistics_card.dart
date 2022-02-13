import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/colors.dart';
import 'categorysTest.dart';

class ProfileStatisticsCard extends StatelessWidget {
  const ProfileStatisticsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Konu İlerlemelerin",
                style: TextStyle(color: blue500, fontSize: 24),
              )),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            children: List.generate(6, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 110,
                  width: 100,
                  child: CircularPercentIndicator(
                    header: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        testCategories[index].name,
                        style: TextStyle(color: blue900),
                      ),
                    ),
                    radius: 40,
                    percent: testCategories[index].percent,
                    animationDuration: 2000,
                    lineWidth: 13,
                    animation: true,
                    progressColor: blue200,
                    backgroundColor: blue200.withOpacity(0.2),
                    circularStrokeCap: CircularStrokeCap.square,
                    center: Text(
                        "%${(testCategories[index].percent * 100).round()}"),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
