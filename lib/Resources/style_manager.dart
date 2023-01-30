// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';

import 'fonts_manager.dart';

TextStyle getTextStyle(double fontsize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontsize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Inter');
}

//regular style

TextStyle getregulartextStyle(
    {required double fontSize,
    FontWeight? fontWeight,
    required Color? color,
    String? fontfamily}) {
  return getTextStyle(
    fontSize,
    FontweightManager.regular,
    color!,
  );
}

//light textStyle

TextStyle getlighttextStyle(
    {required double fontSize,
    FontWeight? fontWeight,
    required Color? color,
    String? fontfamily}) {
  return getTextStyle(
    fontSize,
    FontweightManager.light,
    color!,
  );
}

//Medium TextStyle

TextStyle getmediumtextStyle(
    {required double fontSize,
    FontWeight? fontWeight,
    required Color? color,
    String? fontfamily}) {
  return getTextStyle(
    fontSize,
    FontweightManager.medium,
    color!,
  );
}

//Semi Bold TextStyle

TextStyle getsemiboldtextStyle(
    {required double fontSize,
    FontWeight? fontWeight,
    required Color? color,
    String? fontfamily}) {
  return getTextStyle(
    fontSize,
    FontweightManager.semiBold,
    color!,
  );
}

//Bold Text Style
TextStyle getboldtextStyle(
    {required double fontSize,
    FontWeight? fontWeight,
    required Color? color,
    String? fFontfamily}) {
  return getTextStyle(fontSize, FontweightManager.bold, color!);
}
