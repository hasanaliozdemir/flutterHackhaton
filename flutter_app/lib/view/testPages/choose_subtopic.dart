import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/testPages/solve_test.dart';
import 'package:get/route_manager.dart';

import '../../core/colors.dart';
import '../../models/categor.dart';

class ChoosSubTopic extends StatelessWidget {
  final Category category;
  final String url;
  final int id;
  const ChoosSubTopic({Key? key,required this.category,required this.url,required this.id}) : super(key: key);

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
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: category.subTopics.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: blue400.withOpacity(0.4)
                    ),
                    child: ListTile(
                      title: Text(category.subTopics[index]),
                      trailing: IconButton(
                        icon: const Icon(CupertinoIcons.arrow_right),
                        onPressed: (){
                          Get.to(()=>SolveTest());
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