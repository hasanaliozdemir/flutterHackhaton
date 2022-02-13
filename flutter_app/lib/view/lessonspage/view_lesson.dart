import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';
import 'package:flutter_app/models/categor.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewLesson extends StatefulWidget {
  final Category category;
  final String url;
  final int id;
  ViewLesson({Key? key, required this.category, required this.url, required this.id}) : super(key: key);

  @override
  State<ViewLesson> createState() => _ViewLessonState();
}

class _ViewLessonState extends State<ViewLesson> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: blue500,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Hero(
        tag: "lessonCard${widget.id}}",
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: widget.category.subTopics.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: blue400.withOpacity(0.4)
                    ),
                    child: ListTile(
                      title: Text(widget.category.subTopics[index]),
                      trailing: IconButton(
                        icon: const Icon(CupertinoIcons.arrow_right),
                        onPressed: (){
                          _launchURL(widget.url);
                        },
                      )
                    ),
                  ),
                );
              },
            ),
          )
        ),
      ),
    );
  }
  void _launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
}