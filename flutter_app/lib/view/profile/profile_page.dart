import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/core/components/bottom_bar.dart';
import 'package:flutter_app/core/components/butonMini.dart';
import 'package:flutter_app/services/wrapper.dart';
import 'package:flutter_app/view/profile/categorysTest.dart';
import 'package:flutter_app/view/profile/missinglessons.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'missing_lessons_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Hasan Ali Özdemir";
  String info = "8 . Sınıf";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(index: 3),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 48,),
              Container(
                height: 160,
                
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: blue400.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(32)
                      ),
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(name,style: TextStyle(
                              color: white,
                              fontSize: 30
                            ),),
                            const SizedBox(height: 8,),
                            Text(info,style: TextStyle(
                              color: white,
                              fontSize: 32
                            ),),
                            const SizedBox(height: 8,),
                            Row(

                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    _buildDash(),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              _buildStatistics(),
              const SizedBox(height: 24,),
              Align(alignment:Alignment.centerLeft ,child: Text("Eksik konuların",style: TextStyle(
                color: blue500,
                fontSize: 24
              ),)),
              const SizedBox(height: 8,),
              const MissingLessonsWidget(),
              const SizedBox(
                height: 24,
              ),
              buildSignOut()
            ],
          ),
        ),
      )
    );
  }

  Container _buildStatistics() {
    return Container(
              height: 300,
              
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Konu İlerlemelerin",style: TextStyle(
                      color: blue500,
                      fontSize: 24
                    ),)),
                  const SizedBox(height: 8,),
                  Wrap(
                    children: List.generate(6, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 110,
                          width: 100,
                          
                          child: CircularPercentIndicator(
                            header: Padding(
                              padding: const EdgeInsets.only(bottom:8.0),
                              child: Text(testCategories[index].name,style: TextStyle(
                                color: blue900
                              ),),
                            ),
                            radius: 40,
                            percent: testCategories[index].percent,
                            animationDuration: 2000,
                            lineWidth: 13,
                            animation: true,
                            progressColor: blue200,
                            backgroundColor: blue200.withOpacity(0.2),
                            circularStrokeCap: CircularStrokeCap.square,
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            );
  }

  Widget _buildDash() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/dash04-px.png"),
                        )
                      ),
                      width: 108,
                    ),
    );
  }
}

