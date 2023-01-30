import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/style_manager.dart';

class tabbarTabs extends StatelessWidget {
  String title;
  String text;
  tabbarTabs({
    Key? key,required this.title,required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,style:TextStyle(color: Colors.red,fontSize: 20),),
          Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}

class tabbarTabs1 extends StatelessWidget {

  String text;
  tabbarTabs1({
    Key? key,required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text,
            textAlign: TextAlign.center,
            style:getmediumtextStyle(color: Colors.red,fontSize: 16),),
            
          ],
        ),
      ),
    );
  }
}
