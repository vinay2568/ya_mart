import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/Customer/Home/home_screen.dart';

import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../Widgets/roundButton.dart';
import '../../../network/Utils.dart';
import '../../../network/api_dialog.dart';
import '../../../network/api_helper.dart';
import '../../../utils/app_modal.dart';
import 'SignIn_Screen.dart';
import 'otp_screen.dart';

class CustomerSignIn extends StatefulWidget {
  const CustomerSignIn({super.key});

  @override
  State<CustomerSignIn> createState() => _CustomerSignInState();
}

class _CustomerSignInState extends State<CustomerSignIn> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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

  Widget _buildPassword() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          obscureText: true,
          controller: _passwordController,
          validator: (value) =>
              value!.isEmpty ? "Password cannot be empty" : null,
          style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
          decoration: _buildInputDecoration(
            "Password",
          ),
        ));
  }

  Widget _buildUsername() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _usernameController,
        validator: (value) =>  value!.isEmpty ? "Username cannot be empty" : null,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "User Name",
        ),
      ),
    );
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
                      height: 250,
                      width: 190,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildUsername(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                        title: 'Sign In',
                        onTap: () {
                         _submitHandler(context);
                        },
                        loading: true),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Or continue with',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 30,
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
    loginUser(context);
  }
  loginUser(BuildContext context) async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Logging in...');

    var requestModel={
      "username": _usernameController.text,
      "password": _passwordController.text,
    };

    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postAPI('auth/login/', requestModel, context);
    Navigator.pop(context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);

    if (responseJSON['status'] == 'Login Successfully') {
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

    }
    else if(responseJSON['status']=='OTP Has Been Sent')
      {
        Toast.show('Please verify your mobile number',
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.blue);

        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(_usernameController.text.toString())));

      }

    else {
      Toast.show(responseJSON['errors'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
  }
}
















// import 'package:flutter/material.dart';
// import 'package:ya_mart/Resources/assets_manager.dart';

// import '../../../Resources/color_manager.dart';
// import '../../../Widgets/roundButton.dart';
// import 'otp_screen.dart';

// class CustomerSignIn extends StatefulWidget {
//   const CustomerSignIn({super.key});

//   @override
//   State<CustomerSignIn> createState() => _CustomerSignInState();
// }

// class _CustomerSignInState extends State<CustomerSignIn> {


//   final _formKey = GlobalKey<FormState>();
//   bool loading = false;

//   InputDecoration buildInputDecoration(
//     String hint,
//   ) {
//     return InputDecoration(
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(color: Colors.white)),
//         hintText: hint,
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: ColorManager.whiteColor)),
//         hintStyle: const TextStyle(color: Colors.black),
//         errorStyle: const TextStyle(color: Colors.red),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(color: Colors.white)),
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorManager.whiteColor)));
//   }

//   Widget _buildUserName() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: TextFormField(
//         keyboardType: TextInputType.text,
//         controller: _usernameController,
//         style: const TextStyle(color: Colors.black, fontFamily: 'Inter'),
//         decoration: buildInputDecoration(
//           "User Name ",
//         ),
//       ),
//     );
//   }

//   Widget _buildPassword() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: TextFormField(
//         obscureText: true,
//         keyboardType: TextInputType.text,
//         controller: _passwordController,
//         style: const TextStyle(color: Colors.black, fontFamily: 'Inter'),
//         decoration: buildInputDecoration(
//           "Password",
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorManager.appBackground,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Image.asset(
//                 Images.appLogo,
//                 height: 270,
//                 width: 192,
//               ),
//               Spacer(),
//               _buildUserName(),
//               SizedBox(
//                 height: 20,
//               ),
//               _buildPassword(),
//               SizedBox(
//                 height: 20,
//               ),
//               RoundButton(
//                   title: 'Submit',
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => OtpScreen()));
//                   },
//                   loading: true),
//               SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 'Or continue with',
//                 style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 12.0,
//                     color: Colors.black.withOpacity(0.5)),
//               ),
//               Spacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(Iconss.google),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Image.asset(Iconss.apple),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Image.asset(Iconss.facebook),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//             ],
//           ),
//         ));
//   }
// }
