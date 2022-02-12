import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/bottom_bar.dart';
import 'package:flutter_app/core/components/butonMini.dart';
import 'package:flutter_app/services/wrapper.dart';
import 'package:get/route_manager.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(index: 3),
      body: Center(
        child: ButtonMini.active(text: "SignOut", onPressed: (){
          FirebaseAuth.instance.signOut();
          Get.to(()=>Wrapper(),fullscreenDialog: true);
        }),
      ),
    );
  }
}