import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/homepage/homepage.dart';
import 'package:flutter_app/view/lessonspage/lessons_page.dart';
import 'package:flutter_app/view/profile/profile_page.dart';
import 'package:flutter_app/view/questionsPage/questions_page.dart';
import 'package:get/route_manager.dart';

class CustomBottomBar extends StatelessWidget {
  final int index;
  // ignore: use_key_in_widget_constructors
  const CustomBottomBar({ Key? key,required this.index });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.yellowAccent,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 3,
      backgroundColor: Colors.deepPurpleAccent,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home_outlined)
        ),
        BottomNavigationBarItem(
          label: "Ders&Soru",
          icon: Icon(Icons.feed_outlined)
        ),
        BottomNavigationBarItem(
          label: "Soru Sor",
          icon: Icon(CupertinoIcons.question)
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person)
        ),
      ],
      onTap: (index){
        switch (index) {
              case 0:
                Get.off(()=>HomePage(),fullscreenDialog: true,transition: Transition.fadeIn);
                break;
              case 1:
                Get.to(()=>LessonAndQuestionPage(),fullscreenDialog: true,transition: Transition.fadeIn);
                break;
              case 2:
                Get.to(()=>QuestionsPage(),fullscreenDialog: true,transition: Transition.fadeIn);
                break;
              case 3:
                Get.to(()=>ProfilePage(),fullscreenDialog: true,transition: Transition.fadeIn);
                break;
              
              default:
            }
      },
    );
  }
}