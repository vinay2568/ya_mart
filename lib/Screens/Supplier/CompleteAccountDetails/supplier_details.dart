import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/pickup_addrees.dart';
import 'package:ya_mart/Screens/Supplier/DynamicScreen/dynamic_screen.dart';
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
import '../../../network/constants.dart';
import '../../Customer/AuthenticationScreens/SignIn_Screen.dart';
import 'bank_screen.dart';

class SupplierDetailScreen extends StatefulWidget {
 File? image;
 SupplierDetailScreen(this.image);

  @override
  State<SupplierDetailScreen> createState() => _SupplierDetailScreenState();
}

class _SupplierDetailScreenState extends State<SupplierDetailScreen> {
  final storeNameController = TextEditingController();
  final userNameController = TextEditingController();

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

  int _currentIndex = 3;
  bool chkValue = false;
  bool gstDetails = false;

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  InputDecoration _buildInputDecoration(
    String hint,
  ) {
    return InputDecoration(
      fillColor: Colors.white,
        filled: true,
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





  Widget _iFSCCode() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: storeNameController,
        validator: (value) =>
        value!.isEmpty ? "Store name cannot be empty" : null,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Store Name",
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
        validator: (value) =>
        value!.isEmpty ? "Full name cannot be empty" : null,
        controller: userNameController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Your Full Name",
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
                            '“Store Name” is visible on the Yamart reseller app with your listed products.',
                            style: getregulartextStyle(
                                fontSize: 13, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _accountNo(),
                  SizedBox(
                    height: 10,
                  ),
                  _iFSCCode(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
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
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        'I agree to comply with Yamart seller T&C',
                        style: getregulartextStyle(
                            fontSize: 12, color: Colors.black),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                      title: 'Submit',
                      onTap: () {
                        _submitHandler(context);
                      /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SupplierDynamicScreen()));*/
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

    createSellerAccount(context);

  }



  createSellerAccount(BuildContext context) async {
    FormData requestModel = FormData.fromMap({
      'id': AppModel.userId,
      'gstin': AppModel.gstNumber,
      'gst_verify': true,
      'business_type': AppModel.businessType,
      'business_name': AppModel.businessName,
      'business_address': AppModel.businessAddress,
      'pan_number': '',
      'address_1': AppModel.businessAddress,
      'address_2': '',
      'pincode': AppModel.pincode,
      'city': AppModel.city,
      'state': AppModel.stateName,
      'account_number': AppModel.accountNumber,
      'ifsc_code': AppModel.ifscCode,
      'store_name': storeNameController.text,
      'full_name': userNameController.text,
      //'bank_image': null,
      'bank_image': await MultipartFile.fromFile(widget.image!.path),
    });
    print(AppConstant.appBaseURL + 'auth/profile/');
    print(requestModel.fields);
    print(AppModel.userToken);

    try {
      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer '+AppModel.userToken;
      APIDialog.showAlertDialog(context, 'Creating account...');
      final response = await dio.put(
          AppConstant.appBaseURL + 'auth/profile/',
          data: requestModel);
      var responseBody = response.data;
      print(responseBody.toString());
      Navigator.pop(context);
     /* final jsonData = jsonDecode(responseBody.toString());
      print(jsonData.toString());*/

      Toast.show('Successfully Registered as a Seller',
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.green);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => SupplierDynamicScreen()));




  /*    if (jsonData['status'] == AppConstant.apiSuccess) {
        AppModel.setNewPost(true);
        emit(state.copyWith(profileImage: jsonData['profile_image']));

        Toast.show(jsonData['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.green);
        Navigator.pop(context);
      } else {
        Toast.show(jsonData['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.blue);
      }*/
    } catch (errorMessage) {
      String message = errorMessage.toString();
      print(message);
    }
  }




}




// import 'package:flutter/material.dart';
// import 'package:ya_mart/Resources/color_manager.dart';
// import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
// import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/bank_screen.dart';
// import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
// import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/pickup_addrees.dart';
// import 'package:ya_mart/Widgets/roundButton.dart';

// import '../../../Resources/style_manager.dart';
// import '../DynamicScreen/dynamic_screen.dart';

// class SupplierDetailScreen extends StatefulWidget {
//   const SupplierDetailScreen({Key? key}) : super(key: key);

//   @override
//   State<SupplierDetailScreen> createState() => _SupplierDetailScreenState();
// }

// class _SupplierDetailScreenState extends State<SupplierDetailScreen> {
//   final List<ImageIcon> iconList = [
//     ImageIcon(AssetImage('assets/icons/1st.png')),
//     ImageIcon(AssetImage('assets/icons/1st.png')),
//     ImageIcon(AssetImage('assets/icons/1st.png')),
//     ImageIcon(AssetImage('assets/icons/1st.png')),
//   ];

//   final List imgList = [
//     'assets/icons/1st.png',
//     'assets/icons/location.png',
//     'assets/icons/bank.png',
//     'assets/icons/sup.png',
//   ];
//   final List<String> titleList = [
//     "GST Details",
//     "Pickup Address",
//     "Bank Details",
//     "Supplier Details",
//   ];

//   int _currentIndex = 3;
//   bool chkValue = false;
//   bool gstDetails = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.appBackground,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => GstScreen()));
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//         title: Text(
//           "Complete Account Details",
//           style: getmediumtextStyle(fontSize: 18, color: Colors.black),
//         ),
//         actions: [
//           Center(
//             child: GestureDetector(
//               onTap: () {},
//               child: Text(
//                 "Help?",
//                 style: getmediumtextStyle(
//                     fontSize: 16, color: ColorManager.appBtn),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: 5,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(iconList.length, (index) {
//                 return Container(
//                   padding: EdgeInsets.all(5),
//                   height: 100,
//                   width: 85,
//                   color: Colors.white,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ImageIcon(
//                         AssetImage(imgList[index]),
//                         color: _currentIndex == index
//                             ? Colors.black
//                             : Color(0xFF4c4e4f),
//                         size: 30,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         titleList[index],
//                         textAlign: TextAlign.center,
//                         style: getregulartextStyle(
//                           fontSize: 16,
//                           color: _currentIndex == index
//                               ? Colors.black
//                               : Color(0xFF4c4e4f),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 10,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(iconList.length, (index) {
//                   return Container(
//                     height: 10,
//                     width: 90,
//                     decoration: BoxDecoration(
//                       color: _currentIndex == index
//                           ? Color(0xFFf63e08)
//                           : Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.info,
//                   color: Colors.red,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     color: ColorManager.appBtn.withOpacity(0.15),
//                     width: 10,
//                     child: Text(
//                       '“Store Name” is visible on the Yamart reseller app with your listed products.',
//                       style: getregulartextStyle(
//                           fontSize: 13, color: Colors.black),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             SizedBox(
//               height: 250,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 50,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 5,
//                       child: SizedBox(
//                         height: 70,
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Store Name',
//                             contentPadding: EdgeInsets.only(left: 10),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'Eg. Business Name, Trade Name, etc.',
//                       style: getregulartextStyle(
//                           fontSize: 13, color: Colors.black.withOpacity(0.8)),
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 50,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 5,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Your Full Name',
//                           contentPadding: EdgeInsets.only(left: 10),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             RoundButton(
//                 title: 'Submit',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => SupplierDynamicScreen()));
//                 },
//                 loading: false),
//           ],
//         ),
//       ),
//     );
//   }
// }
