import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/pickup_addrees.dart';
import 'package:ya_mart/Widgets/roundButton.dart';
import 'package:ya_mart/utils/app_modal.dart';

import '../../../Resources/style_manager.dart';

import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';

import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../Widgets/roundButton.dart';
import '../../../network/api_dialog.dart';
import '../../../network/api_helper.dart';
import '../../Customer/AuthenticationScreens/SignIn_Screen.dart';
import 'bank_screen.dart';

class VerifyBankScreen extends StatefulWidget {
  const VerifyBankScreen({super.key});

  @override
  State<VerifyBankScreen> createState() => _VerifyBankScreenState();
}

class _VerifyBankScreenState extends State<VerifyBankScreen> {
  final accountController = TextEditingController();
  final confirmAccountController = TextEditingController();
  final ifscController = TextEditingController();
  final List<ImageIcon> iconList = [
    ImageIcon(AssetImage('assets/icons/1st.png')),
    ImageIcon(AssetImage('assets/icons/1st.png')),
    ImageIcon(AssetImage('assets/icons/1st.png')),
    ImageIcon(AssetImage('assets/icons/1st.png')),
  ];

  final List imgList = [
    'assets/icons/1st.png',
    'assets/icons/location.png',
    'assets/icons/bank.png',
    'assets/icons/sup.png',
  ];
  final List<String> titleList = [
    "GST Details",
    "Pickup Address",
    "Bank Details",
    "Supplier Details",
  ];

  int _currentIndex = 2;
  bool chkValue = false;
  bool gstDetails = false;

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

/*  Widget _buildLastName() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
  }*/

  Widget _confirmAccountNumber() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: confirmAccountController,
        validator: (value) =>
        value!=accountController.text ? "Confirm account is not same as account number" : null,
        obscureText: false,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Confirm Account Number",
        ),
      ),
    );
  }

   Widget _iFSCCode() {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: ifscController,
        validator: (value) =>
        value!.isEmpty ? "IFSC Code cannot be empty" : null,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "IFSC Code",
        ),
      ),
    );
  }

  Widget _accountNo() {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: true,
        validator: (value) =>
        value!.isEmpty ? "Account Number cannot be empty" : null,
        controller: accountController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Account Number",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(

        backgroundColor: ColorManager.appBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GstScreen()));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Complete Account Details",
            style: getmediumtextStyle(fontSize: 18, color: Colors.black),
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Help?",
                  style: getmediumtextStyle(
                      fontSize: 16, color: ColorManager.appBtn),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(iconList.length, (index) {
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 100,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(imgList[index]),
                                color: _currentIndex == index
                                    ? Colors.black
                                    : Color(0xFF4c4e4f),
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                titleList[index],
                                textAlign: TextAlign.center,
                                style: getregulartextStyle(
                                  fontSize: 16,
                                  color: _currentIndex == index
                                      ? Colors.black
                                      : Color(0xFF4c4e4f),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(iconList.length, (index) {
                        return Container(
                          height: 10,
                          width: 75,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? Color(0xFFf63e08)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 Row(
              children: [
                Icon(
                  Icons.info,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: ColorManager.appBtn.withOpacity(0.15),
                    width: 10,
                    child: Text(
                      'Bank account should be in the name of regis-tered business name or trade name as per GSTIN.',
                      style: getregulartextStyle(
                          fontSize: 13, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
                 /* SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorManager.appBtn, width: 1),
                        ),
                        width: 24,
                        height: 24,
                        child: Theme(
                          data: ThemeData(
                              unselectedWidgetColor: ColorManager.appBtn),
                          child: Checkbox(
                            checkColor: ColorManager.appBtn,
                            activeColor: Colors.transparent,
                            value: chkValue,
                            tristate: false,
                            onChanged: (isChecked) {
                              setState(() {
                                chkValue = isChecked!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Text(
                        'Use address registered on GST',
                        style: getregulartextStyle(
                            fontSize: 15, color: Colors.black),
                      )),
                    ],
                  ),*/
                  SizedBox(
                    height: 20,
                  ),
                  _accountNo(),
                  SizedBox(
                    height: 10,
                  ),
                  _confirmAccountNumber(),
                  SizedBox(
                    height: 10,
                  ),
                  _iFSCCode(),
                  SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                title: 'Verify Bank Details',
                onTap: () {
                  _submitHandler(context);

                },
                loading: false),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
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
    validateIFSC();
  }

  validateIFSC() async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Validating account...');
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.getAPI('https://ifsc.razorpay.com/'+ifscController.text, context);
    Navigator.pop(context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);

    if(responseJSON.toString()=='Not Found')
    {
      Toast.show('Invalid account details',
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }
    else
    {

      AppModel.setAccountNumberValue(accountController.text.toString());
      AppModel.setIfscCodeValue(ifscController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BankDetailScreen()));

    }



    /*else {
      Toast.show(responseJSON['errors'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }*/
  }



}


