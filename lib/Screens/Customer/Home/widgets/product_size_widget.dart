
import 'package:flutter/material.dart';

import '../../../../Resources/color_manager.dart';
import '../../../../Resources/style_manager.dart';

class SizeContainerWidget extends StatelessWidget {
  double width;
  String size;
  SizeContainerWidget({Key? key, required this.width, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorManager.darkblue),
        ),
        child: Center(
          child: Text(
            size,
            style: getmediumtextStyle(color: ColorManager.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
