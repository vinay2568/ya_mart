import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';


class CenterTf extends StatelessWidget {
  CenterTf({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  String text;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width*0.92,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius:4,
                offset: Offset(0,5), // changes position of shadow
              ),
            ],
          borderRadius: BorderRadius.circular(12),
          
          color: Colors.white,
          border: Border.all(color: ColorManager.appBtn.withOpacity(0.3))
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
            child: Center(child: Text(text,style: getmediumtextStyle(color: Colors.black,fontSize: 16),))
        ),
      ),
    );
  }
}