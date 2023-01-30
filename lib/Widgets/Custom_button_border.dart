import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/style_manager.dart';

import '../Resources/color_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  String title;
  VoidCallback onTap;
  bool border = false;
  double height;
  double width;
  double titleSize;

  CustomButtonWidget(
      {required this.title,
      required this.onTap,
      required this.border,
      required this.height,
      required this.width,
      required this.titleSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: border == true
              ? BoxDecoration(
                  border: Border.all(color: ColorManager.appBtn),
                  borderRadius: BorderRadius.circular(10),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.appBtn,
                  
                ),
                
          child: Center(
            child: Text(
              title,
              style: getmediumtextStyle(
                  fontSize: titleSize,
                  color: border == true
                      ? ColorManager.appBtn
                      : ColorManager.whiteColor),
            ),
          ),
        ));
  }
}
