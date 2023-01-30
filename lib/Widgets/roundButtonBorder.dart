import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/style_manager.dart';

import '../Resources/color_manager.dart';

class RoundButtonBorder extends StatelessWidget {
  String title;
  VoidCallback onTap;

  RoundButtonBorder({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.appBtn),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  color: ColorManager.appBtn),
          ),
        ),
      ),
    );
  }
}

class RoundButtonBorderWithIcon extends StatelessWidget {
  String title;
  String icon;
  VoidCallback onTap;

  RoundButtonBorderWithIcon({required this.title,required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.appBtn),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 5,),
              ImageIcon(AssetImage(icon),color: ColorManager.appBtn,size: 15,),

              SizedBox(width: 5,),
              Text(
                title,
                style: getregulartextStyle(fontSize: 14, color: ColorManager.appBtn)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
