import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/core/components/bottom_bar.dart';
import 'package:flutter_app/view/homepage/send_question_card.dart';
import 'package:flutter_app/view/homepage/target_question_card.dart';
import 'package:flutter_app/view/homepage/welcom_card.dart';

import 'chose_question_or_lesson.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int money = 100;
  String userName = "Hasan";
  int solved = 50;
  int target = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage("assets/pattern.png"),
              opacity: 0.1,
              fit: BoxFit.cover
            )),
          ),
          Padding(padding: const EdgeInsets.all(16), child: _buildBody()),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(index: 0),
    );
  }

  Column _buildBody() {
    return Column(
        children: [
          const SizedBox(
            height: 68,
          ),
          WelcomeCard(userName: userName, money: money),
          const SizedBox(
            height: 24,
          ),
          TargetQuestionCard(solved: solved, target: target),
          const SizedBox(
            height: 24,
          ),
          const ChoseQuestonOrLesson(),
          const SizedBox(
            height: 24,
          ),
          const SenQuestionCard()
        ],
      );
  }
}

