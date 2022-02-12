import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/core/components/bottom_bar.dart';
import 'package:flutter_app/view/lessonspage/chose_lesson_or_test_card.dart';
import 'package:flutter_app/view/lessonspage/lessonCard.dart';

class LessonAndQuestionPage extends StatefulWidget {
  LessonAndQuestionPage({Key? key}) : super(key: key);

  @override
  State<LessonAndQuestionPage> createState() => _LessonAndQuestionPageState();
}

class _LessonAndQuestionPageState extends State<LessonAndQuestionPage> {
  bool _isLesson = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(index: 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 48,),
            const ChoseLessonOrTestCard(),
            const SizedBox(height: 32,),
            Wrap(
              children: List.generate(6, (index) => LessonCard(index: index+1)),
            )
          ],
        ),
      ),
    );
  }
}

