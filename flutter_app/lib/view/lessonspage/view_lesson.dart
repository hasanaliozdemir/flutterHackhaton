import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:get/route_manager.dart';

class ViewLesson extends StatefulWidget {
  ViewLesson({Key? key}) : super(key: key);

  @override
  State<ViewLesson> createState() => _ViewLessonState();
}

class _ViewLessonState extends State<ViewLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue500,
        leading: IconButton(
          icon: Icon(CupertinoIcons.left_chevron),
          onPressed: (){
            Get.back();
          },
        ),
      ),
    );
  }
}