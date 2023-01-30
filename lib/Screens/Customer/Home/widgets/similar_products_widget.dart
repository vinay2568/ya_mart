import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../Resources/color_manager.dart';


class SimilarShirtWidget extends StatelessWidget {
  String img;
  VoidCallback ontap;
  SimilarShirtWidget({Key? key, required this.img,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: ontap,
          child: Container(
              decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
              ),
              child: Center(
          child: Image(
            image: AssetImage(img),
          ),
              ),
            ),
        ));
  }
}
