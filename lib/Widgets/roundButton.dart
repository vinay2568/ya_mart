import 'package:flutter/material.dart';

import '../Resources/color_manager.dart';

class RoundButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
  bool loading;

  RoundButton(
      {required this.title, required this.onTap, required this.loading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
            color: ColorManager.appBtn,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
class RoundButton2 extends StatelessWidget {
  String title;
  VoidCallback onTap;
  bool loading;

  RoundButton2(
      {required this.title, required this.onTap, required this.loading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
            color: ColorManager.appBtn,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}