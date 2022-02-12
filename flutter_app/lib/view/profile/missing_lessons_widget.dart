import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/profile/missinglessons.dart';
import 'package:get/route_manager.dart';

import '../../core/colors.dart';
import '../../core/components/butonMini.dart';
import '../../services/wrapper.dart';

class MissingLessonsWidget extends StatelessWidget {
  const MissingLessonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: blue100
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical:4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: white.withOpacity(0.4)
                  ),
                  child: ListTile(
                    title: Text(testLessons[index].category),
                    subtitle: Text(testLessons[index].subTopic),
                    trailing: IconButton(
                      icon: const Icon(CupertinoIcons.arrow_right),
                      onPressed: (){
                        print(testLessons[index].lessonUrl);
                      },
                    )
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }
}

buildSignOut(){
  return Center(
        child: ButtonMini.active(text: "SignOut", onPressed: (){
          FirebaseAuth.instance.signOut();
          Get.to(()=>Wrapper(),fullscreenDialog: true);
        }),
      );
}