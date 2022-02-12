import 'package:flutter/material.dart';
import 'package:flutter_app/core/colors.dart';

class LessonCard extends StatelessWidget {
  final int index;
  const LessonCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), 
            color: _returnColor(index),
            
            ),
            child: Center(
              child: Text(_returnName(index),style: TextStyle(
                color: white,
                fontSize: 24
              ),),
            ),
      ),
    );
  }

  _returnColor(index) {
    switch (index) {
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.green;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.purple;
      case 6:
        return Colors.brown;

      default:
    }
  }

  _returnName(index) {
    switch (index) {
      case 1:
        return "Matematik";
      case 2:
        return "Fen";
      case 3:
        return "Türkçe";
      case 4:
        return "Sosyal";
      case 5:
        return "İngilizce";
      case 6:
        return "Din";

      default:
    }
  }
}
