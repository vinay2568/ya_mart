import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Screens/Customer/AuthenticationScreens/otp_screen.dart';
import 'package:ya_mart/Screens/Customer/Home/home_screen.dart';
import 'package:ya_mart/utils/app_theme.dart';

import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../Widgets/roundButton.dart';
import '../../../network/api_dialog.dart';
import '../../../network/api_helper.dart';
import 'SignIn_Screen.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({super.key});

  @override
  State<CustomerSignUp> createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp> {
  final _emailController = TextEditingController();
  bool isSeller=false;
  final _phoneController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  InputDecoration _buildInputDecoration(
    String hint,
  ) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white)),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: ColorManager.whiteColor)),
        hintStyle: TextStyle(color: Colors.black),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.whiteColor)));
  }

  Widget _buildFirstName() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _firstNameController,
        validator: (value) =>
            value!.isEmpty ? "First name cannot be empty" : null,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "First Name",
        ),
      ),
    );
  }

 

  Widget _buildLastName() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          controller: _lastNameController,
          validator: (value) =>
              value!.isEmpty ? "Last name cannot be empty" : null,
          style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
          decoration: _buildInputDecoration(
            "Last Name",
          ),
        ));
  }

  Widget _buildEmail() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _emailController,
        validator: (value) => !isEmail(value!)
            ? "Sorry, we do not recognize this email address"
            : null,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Email Address",
        ),
      ),
    );
  }
  String? checkEmptyString(String? value) {
    if (value!.isEmpty) {
      return 'Cannot be Empty';
    }
    return null;
  }

  String? checkPasswordValidator(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.length < 7 && value.length > 17) {
      return 'Password should be between 8-16 character and combination of at-least 1 number, 1 Alphabet and 1 special character.';
    }else{
      if(!regex.hasMatch(value)){
        return 'Password should be between 8-16 character and combination of at-least 1 number, 1 Alphabet and 1 special character.';
      }else{
        return null;
      }
    }
  }
  Widget _buildPhone() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: phoneValidator,
        maxLength: 10,
        keyboardType: TextInputType.number,
        controller: _phoneController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Mobile number",
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        obscureText: true,
        validator: checkPasswordValidator,
        keyboardType: TextInputType.text,
        controller: _passwordController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Password",
        ),
      ),
    );
  }
  String? checkConfirmPasswordValidator(String? value) {
    if(_passwordController.text.isEmpty && _confirmPasswordController.text.isEmpty)
      {
        return 'Cannot be empty';
      }


   else if(_passwordController.text!=_confirmPasswordController.text){
      return 'Password and Confirm password should be same';
    }else{
      return null;
    }

  }

  Widget _buildConfirmPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        obscureText: true,
        validator: checkConfirmPasswordValidator,
        keyboardType: TextInputType.text,
        controller: _confirmPasswordController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Confirm Password",
        ),
      ),
    );
  }

  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(regex);

    return value.isNotEmpty && regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        backgroundColor: ColorManager.appBackground,
        body: Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                // new line
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      Images.appLogo,
                      height: 83,
                      width: 83,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Hello!',
                        style: getTextStyle(
                            24, FontweightManager.bold, ColorManager.black)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Create your account to start',
                        style: getTextStyle(16, FontweightManager.regular,
                            ColorManager.black.withOpacity(0.5))),
                    SizedBox(
                      height: 20,
                    ),
                    _buildFirstName(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildLastName(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildPhone(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildEmail(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildConfirmPassword(),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [



                        GestureDetector(
                            onTap: (){
                              setState(() {
                                isSeller=!isSeller;
                              });
                            },
                            child: Container(child:

                            isSeller?

                                Icon(Icons.check_box,color: ColorManager.appBtn):
                            Icon(Icons.check_box_outline_blank_outlined))),

                        SizedBox(width: 5),



                        Text('Register as a Seller',style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15
                        )),




                      ],
                    )

                    ),

                    SizedBox(
                      height: 15,
                    ),



                    RoundButton(
                        title: 'Sign up',
                        onTap: () {
                          _submitHandler(context);
                        },
                        loading: true),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Iconss.google),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(Iconss.apple),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(Iconss.facebook),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomerSignIn()));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  color: ColorManager.blue),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    registerUser(context);
  }
  registerUser(BuildContext context) async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Registering account...');

    var requestModel={
      "username": _phoneController.text,
      "password": _passwordController.text,
      "confirm_password": _confirmPasswordController.text,
      "email": _emailController.text,
      "first_name": _firstNameController.text,
      "last_name": _lastNameController.text,
      "hint":isSeller?"seller":"customer"
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('auth/registration/', requestModel, context);
    Navigator.pop(context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);

    if (responseJSON['status'] == 'Your Account is Created But You Have To Verify The Mobile Number') {
      Toast.show(responseJSON['status'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);
      Route route = MaterialPageRoute(builder: (context) => OtpScreen(_phoneController.text));
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);

    } else {
      Toast.show(responseJSON['errors'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }
  String? phoneValidator(String? value) {
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value!)) {
      return 'Enter a valid Mobile Number';
    }
    return null;
  }

}
