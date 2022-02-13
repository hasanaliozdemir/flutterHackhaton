import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/core/components/bottom_bar.dart';

import 'package:flutter_app/view/profile/categorysTest.dart';
import 'package:flutter_app/view/profile/profile_statistics_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'missing_lessons_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Hasan Ali Özdemir";
  String info = " 8. Sınıf";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomBottomBar(index: 3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3f000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: blue400.withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                height: 208,
                child: Row(
                  children: [
                    SizedBox(
                      width: 170,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              name,
                              style: TextStyle(color: white, fontSize: 30),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                info,
                                style: TextStyle(color: white.withOpacity(0.7), fontSize: 32),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row()
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.circle_grid_hex,size: 20,color: Colors.yellowAccent,),
                              SizedBox(width: 4,),
                              Text("100",style: TextStyle(
                                color: white,
                                fontSize: 20
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    _buildDash(),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ProfileStatisticsCard(),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Eksik konuların",
                      style: TextStyle(color: blue500, fontSize: 24),
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: MissingLessonsWidget(),
              ),
              const SizedBox(
                height: 24,
              ),
              buildSignOut()
            ],
          ),
        ));
  }


  Widget _buildDash() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/dash04-px.png"),
        )),
        width: 108,
      ),
    );
  }
}

