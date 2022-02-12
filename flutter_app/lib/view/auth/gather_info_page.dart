import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/butonMini.dart';
import 'package:flutter_app/core/components/textInput.dart';
import 'package:flutter_app/services/database_service.dart';

import '../../core/colors.dart';

class RegisterInfoPage extends StatefulWidget {
  final User user;
  RegisterInfoPage({Key? key, required this.user}) : super(key: key);

  @override
  State<RegisterInfoPage> createState() => _RegisterInfoPageState();
}

class _RegisterInfoPageState extends State<RegisterInfoPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  bool _isChecked = false;
  String? _selectedGender;
  FocusNode _nameFocus = FocusNode();
  FocusNode _ageFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("One more step..",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        color: blue500))),
            const SizedBox(
              height: 32,
            ),
            TextInputSimple(
              hintText: "Name",
              controller: _nameController, focusNode: _nameFocus),
            const SizedBox(
              height: 16,
            ),
            TextInputSimple(
              hintText: "Grade",
              keyBoardType: TextInputType.numberWithOptions(signed: true, decimal: true),
              controller: _ageController, focusNode: _ageFocus),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Agree to Terms & Conditions  "),
                Checkbox(
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val ?? false;
                      });
                    })
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: ButtonMini.active(text: "Start", onPressed: start))
          ],
        ),
      ),
    );
  }

  start() {
    try {
      DatabaseService(widget.user.uid).updateUserData(_nameController.text, widget.user.email!,int.parse(_ageController.text));
    } catch (e) {
      print(e);
    }
    
  }
}
