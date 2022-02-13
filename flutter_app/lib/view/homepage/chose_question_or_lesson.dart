import 'package:flutter/cupertino.dart';
import 'package:flutter_app/view/testPages/chose_lesson.dart';
import 'package:get/route_manager.dart';

import '../../core/colors.dart';

class ChoseQuestonOrLesson extends StatelessWidget {
  const ChoseQuestonOrLesson({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: blue700.withOpacity(0.6)),
      height: 120,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(()=>ChooseLesson());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8)),
              width: 144,
              child: Center(
                child: Row(
                  children: [SizedBox(width: 8,),
                    Icon(CupertinoIcons.pencil_ellipsis_rectangle,color: white,size: 20,),
                    SizedBox(width: 8,),
                    Text("Soru Çöz",style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ),),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                color: white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8)),
            width: 144,
            child: Center(
              child: Row(
                children: [SizedBox(width: 8,),
                  Icon(CupertinoIcons.play_circle,color: white,size: 20,),
                  SizedBox(width: 4,),
                  Text("Konu Dinle",style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
