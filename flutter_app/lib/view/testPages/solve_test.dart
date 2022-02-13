import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/butonMini.dart';
import 'package:flutter_app/view/testPages/fullScreenQuestion.dart';
import 'package:flutter_app/view/testPages/test_data.dart';
import 'package:get/route_manager.dart';

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

  finishTest() {}
}
