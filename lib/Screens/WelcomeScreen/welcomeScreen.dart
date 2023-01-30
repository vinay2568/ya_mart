import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/fonts_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';

import '../Customer/AuthenticationScreens/SignIn_Screen.dart';
import '../Customer/AuthenticationScreens/signUp_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Images.appLogo,
              height: 262,
              width: 247,
            ),
            Image.asset(
              Iconss.houseCart,
              height: 128,
              width: 109,
            ),
            Text(
                'Explore all the most exiting product\nbased on your interest and needs. ',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  
                    16, FontweightManager.regular, ColorManager.black.withOpacity(0.5))),
            Container(
              width: _width,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorManager.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerSignUp()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorManager.whiteColor,
                        ),
                        child: Center(
                          child: Text('Register',
                              style: getTextStyle(19, FontweightManager.regular,
                                  ColorManager.black)),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerSignIn()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorManager.appBackground,
                        ),
                        child: Center(
                          child: Text('Sign In',
                              style: getTextStyle(19, FontweightManager.regular,
                                  ColorManager.black)),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
