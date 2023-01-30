import 'package:flutter/material.dart';

import '../../../../Resources/color_manager.dart';
import '../../../../Resources/fonts_manager.dart';
import '../../../../Resources/style_manager.dart';

class CategoriesCircle extends StatelessWidget {
  String img;
  String txt;
  VoidCallback ontap;
  double height;
  double width;
  CategoriesCircle(
      {required this.img,
      required this.height,
      required this.width,
      required this.txt,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(0),
            height: height,
            width: width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
          ),
          Text(
            txt,
            style:
                getTextStyle(13, FontweightManager.medium, ColorManager.black),
          ),
        ],
      ),
    );
  }
}
