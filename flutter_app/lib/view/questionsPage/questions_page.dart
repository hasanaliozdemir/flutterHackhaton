import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/core/components/bottom_bar.dart';
import 'package:flutter_app/view/questionsPage/send_question.dart';
import 'package:flutter_app/view/questionsPage/testQuestionsData.dart';
import 'package:get/route_manager.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(index: 2),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>SendQuestionPage());
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24), color: blue500),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Soru Gönder",
                            style: TextStyle(fontSize: 32, color: white),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            CupertinoIcons.paperplane_fill,
                            size: 32,
                            color: white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/dash01.png"))
                  ),
                  height: 200,
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Önceki Soruların",
                    style: TextStyle(
                        color: blue500,
                        fontWeight: FontWeight.w200,
                        fontSize: 28),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Container(
            height: 249,
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(itemCount: testQuestions.length, itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: gray500))
                  ),
                  child: ListTile(
                    title: Text(testQuestions[index].category),
                    subtitle: Text(testQuestions[index].date.toString()),
                    trailing: (testQuestions[index].solved)? Icon(CupertinoIcons.check_mark_circled,color: Colors.green,) : Icon(CupertinoIcons.clock,color: Colors.brown ,)
                  ),
                );
              },),
            ),
          )
        ],
      ),
    );
  }
}
