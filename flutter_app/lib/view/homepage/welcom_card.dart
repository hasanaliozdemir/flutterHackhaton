import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    Key? key,
    required this.userName,
    required this.money,
  }) : super(key: key);

  final String userName;
  final int money;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: blue700.withOpacity(0.4)),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              "Hoşgeldin $userName",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.yellowAccent,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            money.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.all(2),
                      child: Icon(CupertinoIcons.bell),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
