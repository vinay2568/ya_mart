import 'package:flutter/material.dart';

import '../../../../Resources/color_manager.dart';
import '../../../../Resources/style_manager.dart';

class ProductDetailPageTitle extends StatelessWidget {
  String title;
  ProductDetailPageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: getmediumtextStyle(
          fontSize: 20,
          color: ColorManager.black,
        ));
  }
}