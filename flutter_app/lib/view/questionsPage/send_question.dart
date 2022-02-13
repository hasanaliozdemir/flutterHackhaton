import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/core/components/butonMini.dart';
import 'package:flutter_app/models/question.dart';
import 'package:flutter_app/view/questionsPage/questions_page.dart';
import 'package:flutter_app/view/questionsPage/testQuestionsData.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class SendQuestionPage extends StatefulWidget {
  SendQuestionPage({Key? key}) : super(key: key);

  @override
  State<SendQuestionPage> createState() => _SendQuestionPageState();
}

class _SendQuestionPageState extends State<SendQuestionPage> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _newPath;

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
      body: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          Text("Sorunuzun Fotoğrafını Yükleyiniz",style: TextStyle(
            color: blue500,
            fontSize: 18
          ),),
          const SizedBox(height: 24,),
          Center(
            child: GestureDetector(
              onTap: () async{
                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                var _byte = await image?.readAsBytes();
                setState(() {
                  _newPath = _byte;
                });
              },
              child: Container(
                
                decoration: _switchImage(),
                height: 250,
                width: 350,
              ),
            ),
          ),
          const SizedBox(height: 24,),
          Text("Sorunuzun Açıklamasını Yazın",style: TextStyle(
            color: blue500,
            fontSize: 18
          ),),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: gray600),
                color: white
              ),
              child: const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          SizedBox(height: 24,),
          ButtonMini.active(text: "Gönder", onPressed: (){
            Get.to(()=>QuestionsPage());
            Get.snackbar("Gönderildi", "Sorunuz başarıyla gönderilmiştir",
            barBlur: 10000
            );
          })


        ],
      ),
    );
  }
  _switchImage(){
    if (_newPath == null) {
      return BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16)
      );
    } else {
      return BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(_newPath!)
                  )
                );
    }
  }
}