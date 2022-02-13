import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/butonMini.dart';
import 'package:flutter_app/view/homepage/homepage.dart';
import 'package:flutter_app/view/testPages/fullScreenQuestion.dart';
import 'package:flutter_app/view/testPages/test_data.dart';
import 'package:get/route_manager.dart';
import 'package:kartal/kartal.dart';

import '../../core/colors.dart';

class SolveTest extends StatefulWidget {
  SolveTest({Key? key}) : super(key: key);

  @override
  State<SolveTest> createState() => _SolveTestState();
}

class _SolveTestState extends State<SolveTest> {
  int _currentIndex = 0;
  GroupController controller = GroupController();
  List<int?> answers = List<int>.filled(testData[0].length,4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soru ${_currentIndex + 1} / ${testData[0].length}"),
        backgroundColor: blue500,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
              onTap: () {
                Get.to(() => FullScreenImage(
                    url: testData[0].questions[_currentIndex].imageUrl));
              },
              child:
                  Image.network(testData[0].questions[_currentIndex].imageUrl)),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SimpleGroupedChips(
              controller: controller,
              itemTitle: const ["A", "B", "C", "D", "Boş"],
              values: const [0, 1, 2, 3, 4],
              chipGroupStyle: ChipGroupStyle.minimize(
                backgroundColorItem: blue600.withOpacity(0.3),
                itemTitleStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                (_currentIndex != 0)
                    ? ButtonMini.active(
                        text: "Önceki Soru",
                        onPressed: () {
                          setState(() {
                            _currentIndex = _currentIndex - 1;
                            controller.select(answers[_currentIndex]);
                          });
                        })
                    : SizedBox(),
                    Spacer(),
                (_currentIndex + 1 != testData[0].length)
                    ? ButtonMini.active(
                        text: "Sonraki Soru",
                        onPressed: () {
                          setState(() {
                            _currentIndex = _currentIndex + 1;
                            answers[_currentIndex-1] = controller.selectedItem;
                            controller.select(answers[_currentIndex]);
                            print(answers);
                          });
                        })
                    : ButtonMini.active(
                        text: "Bitir",
                        onPressed: () {
                          finishTest();
                        })
              ],
            ),
          )
        ],
      ),
    );
  }

  finishTest() {
    showDialog(context: context, builder: (BuildContext context){
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 352,
            height:400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
              border: Border.all(width:2,color: blue500)
            ),
            child: Column(
              children: [
                SizedBox(height: 16,),
                Text("Sonuçlar", style: TextStyle(
                  color: blue500,
                  fontSize: 24,
                  fontWeight: FontWeight.w400
                ),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height:250,
                    
                    decoration: BoxDecoration(
                      color: blue100.withOpacity(0.4)
                    ),
                    child: ListView.builder(
                      itemCount: testData[0].questions.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          title: Text("Soru ${index+1}"),
                          trailing: _buildLeading(index),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Center(
                  child: ButtonMini.active(text: "Tamam", onPressed: (){
                    Navigator.pop(context);
                    Get.to(()=>HomePage());
                  }),
                )
              ],
            ),
          ),
        ),
      );
    }); 
  }

  _buildLeading(index){
    if (testData[0].questions[index].answer == answers[index]) {
      
      return Text("Doğru",style: TextStyle(color: Colors.green),);
    } else {
      return Text(_returnLetter(index),style: TextStyle(color: Colors.red),);
    }
  }

  _returnLetter(i){
    switch (i) {
      case 0:
        return "A";
      case 1:
        return "B";
              case 2:
        return "C";
              case 3:
        return "D";
      default:
      return "Boş";
    }
  }
}
