import'package:flutter/material.dart';

import '../Resources/color_manager.dart';

  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
InputDecoration _buildInputDecoration(String hint, String iconPath) {
    return InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color.fromRGBO(252, 252, 252, 1))),
        hintText: hint,
        prefixIcon: iconPath != ''
            ? Image.asset(
                iconPath,
                width: 30,
                height: 30,
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: ColorManager.appBtn)),
        hintStyle: TextStyle(color: Color.fromRGBO(252, 252, 252, 1)),
        errorStyle: TextStyle(color: Color.fromRGBO(248, 218, 87, 1)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.appBtn)));
  }

  Widget buildEmail() {
    return TextFormField(
      validator: (value) => !isEmail(value!)
          ? "Sorry, we do not recognize this email address"
          : null,
      style: TextStyle(
          color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'Inter'),
      decoration: _buildInputDecoration("Email", ''),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      validator: (value) => value!.length <= 6
          ? "Password must be 6 or more characters in length"
          : null,
      style: TextStyle(
          color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'Inter'),
      decoration: _buildInputDecoration("Password", 'assets/lock.png'),
    );
  }

  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(regex);

    return value.isNotEmpty && regExp.hasMatch(value);
  }