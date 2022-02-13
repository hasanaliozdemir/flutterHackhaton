import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/testPages/lesson_test_page.dart';
import 'package:get/route_manager.dart';

import '../../core/colors.dart';

class ChooseLesson extends StatelessWidget {
  const ChooseLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue500,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:32.0),
        child: Column(
          children: [
            const SizedBox(height: 48,),
            Wrap(
              
              children: List.generate(6, (index) => LessonTestPage(index: index+1)),
            )
          ],
        ),
      ),
    );
  }
}