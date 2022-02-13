import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/view/lessonspage/view_lesson.dart';
import 'package:flutter_app/view/profile/categorysTest.dart';
import 'package:flutter_app/view/profile/missinglessons.dart';
import 'package:flutter_app/view/testPages/choose_subtopic.dart';
import 'package:get/route_manager.dart';

class LessonTestPage extends StatelessWidget {
  final int index;
  const LessonTestPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 168,
        child: Column(
          children: [
            Text(_returnName(index),style: TextStyle(
                  color: blue500,
                  fontSize: 24
                ),),
            GestureDetector(
              onTap: () {
                Get.to(()=>ChoosSubTopic(category: testCategories[index-1],url: testLessons[1].lessonUrl,id: index+1,));
              },
              child: Hero(
                tag: "lessonCard$index",
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24), 
                      color: blue700.withOpacity(0.5),
                      image: DecorationImage(
                        image: AssetImage(_returnPath()),
                        opacity: 1
                      )
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

_returnPath(){
  switch (index) {
    case 1:
      return "assets/icons/mathicon.png";
    case 2:
      return "assets/icons/fenicon.png";
    case 3:
      return "assets/icons/trkicon.png";
    case 4:
      return "assets/icons/historyicon.png";
    case 5:
      return "assets/icons/engicon.png";
    case 6:
      return "assets/icons/dinicon.png";
    default:
  }
}


  _returnName(index) {
    switch (index) {
      case 1:
        return "Matematik";
      case 2:
        return "Fen Bilimleri";
      case 3:
        return "Türkçe";
      case 4:
        return "Sosyal";
      case 5:
        return "İngilizce";
      case 6:
        return "Din";

      default:
    }
  }
}
