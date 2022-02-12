import 'package:flutter/material.dart';
import 'package:flutter_app/view/homepage/homepage.dart';
import 'package:flutter_app/view/profile/profile_page.dart';
import 'package:get/route_manager.dart';

class CustomBottomBar extends StatelessWidget {
  final int index;
  CustomBottomBar({ Key? key,required this.index });

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
          label: "Page 2",
          icon: Icon(Icons.feed_outlined)
        ),
        BottomNavigationBarItem(
          label: "Page 3",
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person)
        ),
      ],
      onTap: (index){
        switch (index) {
              case 0:
                Get.off(()=>HomePage(),fullscreenDialog: true);
                break;
              case 1:
                Get.to(()=>HomePage(),fullscreenDialog: true);
                break;
              case 2:
                Get.to(()=>HomePage(),fullscreenDialog: true);
                break;
              case 3:
                Get.to(()=>ProfilePage(),fullscreenDialog: true);
                break;
              
              default:
            }
      },
    );
  }
}