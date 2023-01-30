import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/Customer/Home/home_screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/supplier_details.dart';
import 'package:ya_mart/Screens/Supplier/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/WelcomeScreen/welcomeScreen.dart';



class SplashScreen extends StatefulWidget {
 final String token;
 SplashScreen(this.token);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  File? image;
  @override
  void initState() {
    super.initState();

    widget.token!=''?
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DynamicScreen()))):
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
        color: ColorManager.splashBackground,
      ),
      child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            Images.appLogo,
            fit: BoxFit.cover,
          ),
        ),)
    ));
  }
}
