import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/style_manager.dart';


class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: TextField(
          decoration: InputDecoration(
            hintText: text,
            hintStyle: getregulartextStyle(color: Colors.grey.shade600,fontSize: 15),
            border: InputBorder.none,
          ),
        )
      ),
    );
  }
}