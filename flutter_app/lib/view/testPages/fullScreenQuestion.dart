import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../core/colors.dart';

import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {
  final String url;
  const FullScreenImage({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue500,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.multiply),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Container(
    child: PhotoView(
      imageProvider: NetworkImage(url),
    )
  ),
    );
  }
}