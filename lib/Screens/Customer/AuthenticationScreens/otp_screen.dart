import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/style.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';

import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../Widgets/roundButton.dart';
import '../../../network/Utils.dart';
import '../../../network/api_dialog.dart';
import '../../../network/api_helper.dart';
import '../../../utils/app_modal.dart';
import '../Home/home_screen.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  final String userPhoneNumber;
  OtpScreen(this.userPhoneNumber);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  String enteredOTP='';

  InputDecoration _buildInputDecoration(
    String hint,
  ) {
    return InputDecoration(
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

  Widget _buildPhone() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
          decoration: _buildInputDecoration(
            "",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        backgroundColor: ColorManager.appBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Image.asset(
                Images.appLogo,
                height: 170,
                width: 162,
              ),
              Text('Enter otp',
                  style: getTextStyle(
                      24, FontweightManager.bold, ColorManager.black)),

              Container(
                margin: const EdgeInsets
                    .symmetric(
                    horizontal: 20),
                height: 55,
                child: Center(
                  child: OTPTextField(
                    length: 4,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.white,
                      borderColor: Colors.white
                    ),
                    width: MediaQuery.of(context).size.width,
                    fieldWidth:50,
                    style: TextStyle(
                        fontSize: 17
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) {
                      enteredOTP=pin;
                      print("Completed: " + pin);
                    },
                  ),
                ),
              ),


              RoundButton(
                  title: 'Get Started',
                  onTap: () {

                    if(enteredOTP.length!=4)
                      {
                        Toast.show('Please enter a valid OTP !!',
                            duration: Toast.lengthLong,
                            gravity: Toast.bottom,
                            backgroundColor: Colors.red);
                      }
                    else
                      {
                        // API Call
                        verifyOTP(context);



                      }




                   /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  DynamicScreen()));*/
                  },
                  loading: true),
             const SizedBox(),
             const SizedBox(),
             const SizedBox(),
            ],
          ),
        ));
  }

  verifyOTP(BuildContext context) async {
    APIDialog.showAlertDialog(context, 'Verifying OTP...');

    var requestModel={
      "number": widget.userPhoneNumber,
      "otp": enteredOTP,
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('auth/verify-otp/', requestModel, context);
    Navigator.pop(context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
//Your Number is Verifyed
    //Your Profile Has Been Created
    if (responseJSON['status'] == 'Your Number is Verifyed' || responseJSON['status']=='Your Profile Has Been Created') {
      Toast.show(responseJSON['status'],
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);
      MyUtils.saveSharedPreferences(
          'access_token', responseJSON['token']['access']);
      MyUtils.saveSharedPreferences(
          'refresh_token', responseJSON['token']['refresh']);
      AppModel.setTokenValue(responseJSON['token']['access']);

      Route route = MaterialPageRoute(builder: (context) => DynamicScreen());
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);

    } else {
      Toast.show(responseJSON['status'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }


}
