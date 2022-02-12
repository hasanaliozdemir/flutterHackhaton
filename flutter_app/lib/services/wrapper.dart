import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/auth/auth.dart';
import 'package:flutter_app/view/homepage/homepage.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
    bool _auth = (FirebaseAuth.instance.currentUser == null) ? false : true;

  

  init(){
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      _auth = false;
    } else {
      _auth = true;
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    if (_auth==null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      if (_auth == true) {
        return HomePage();
      } else {
        return AuthPage();
      }
    }
  }
}