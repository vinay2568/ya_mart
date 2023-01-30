import 'package:flutter/material.dart';


import '../../../../Resources/color_manager.dart';
import '../../../../Resources/fonts_manager.dart';
import '../../../../Resources/style_manager.dart';

class LowPriceStore extends StatelessWidget {
  String img;
  String txt;
  String? txt1;
  VoidCallback ontap;
  LowPriceStore(
      {super.key, required this.img,
      required this.txt,
     this.txt1,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 150,
            width: 138,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorManager.whiteColor,
              border: Border.all(color: ColorManager.darkblue),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 107,
                    width: 99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                            image: AssetImage(img), fit: BoxFit.fill)),
                  ),
                  Text(
                    txt,
                    style: getTextStyle(
                        13, FontweightManager.medium, ColorManager.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            txt1!,
            style: getTextStyle(
                13, FontweightManager.semiBold, ColorManager.darkblue),
          )
        ],
      ),
    );
  }
}

class PopularStore extends StatelessWidget {
  String img;
  String txt;
  String? txt1;
  VoidCallback ontap;
  PopularStore(
      {super.key, required this.img,
        required this.txt,
        this.txt1,
        required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 150,
            width: 138,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorManager.whiteColor,
              border: Border.all(color: ColorManager.darkblue),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 107,
                    width: 99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                            image: NetworkImage(img), fit: BoxFit.fill)),
                  ),
                  Text(
                    txt,
                    maxLines: 1,
                    style: getTextStyle(
                        13, FontweightManager.medium, ColorManager.black),
                  ),
                ],
              ),
            ),
          ),
          Text(
            txt1!,
            style: getTextStyle(
                13, FontweightManager.semiBold, ColorManager.darkblue),
          )
        ],
      ),
    );
  }
}


