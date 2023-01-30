import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/pickup_addrees.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/supplier_details.dart';
import 'package:ya_mart/Widgets/roundButton.dart';
import 'package:ya_mart/utils/app_modal.dart';

import '../../../Resources/style_manager.dart';

import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';

import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../Widgets/roundButton.dart';
import '../../../Widgets/roundButtonBorder.dart';
import '../../Customer/AuthenticationScreens/SignIn_Screen.dart';
import 'bank_screen.dart';

class BankDetailScreen extends StatefulWidget {
  const BankDetailScreen({super.key});

  @override
  State<BankDetailScreen> createState() => _BankDetailScreenState();
}

class _BankDetailScreenState extends State<BankDetailScreen> {
  final accountController = TextEditingController();
  final confirmAccountController = TextEditingController();
  final ifscController = TextEditingController();
  File? checkImage;
  final picker = ImagePicker();

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


  Widget _confirmAccountNumber() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        enabled: false,
        keyboardType: TextInputType.number,
        controller: confirmAccountController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "646766623",
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
        enabled: false,
        keyboardType: TextInputType.text,
        controller: ifscController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "KKBK0001244",
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
        obscureText: false,
        enabled: false,
        keyboardType: TextInputType.number,
        controller: accountController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          '**********'
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
                                    ? ColorManager.darkGreen
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
                                      ? ColorManager.darkGreen
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
                  _confirmAccountNumber(),
                  SizedBox(
                    height: 10,
                  ),
                  _iFSCCode(),
                  SizedBox(
                    height: 20,
                  ),

                  RoundButtonBorderWithIcon(icon: Iconss.up,
                      title: 'Upload Cancelled Cheque/Passbook', onTap: () {

                      getImage();

                      }),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Cheque/Passbook should have business or trade name on it',
                    textAlign: TextAlign.center,
                    style:
                        getregulartextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  RoundButton(
                title: 'Submit',
                onTap: () {

                  if(checkImage==null)
                    {
                      Toast.show('Please upload a cheque',
                          duration: Toast.lengthLong,
                          gravity: Toast.bottom,
                          backgroundColor: Colors.red);
                    }
                  else
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SupplierDetailScreen(checkImage)));
                    }
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountController.text=AppModel.accountNumber;
    confirmAccountController.text=AppModel.accountNumber;
    ifscController.text=AppModel.ifscCode;
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 25);
    if (pickedFile != null) {
      checkImage = File(pickedFile.path);
    }
  }
}








// import 'package:flutter/material.dart';
// import 'package:ya_mart/Resources/assets_manager.dart';
// import 'package:ya_mart/Resources/color_manager.dart';
// import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
// import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/pickup_addrees.dart';
// import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/supplier_details.dart';
// import 'package:ya_mart/Widgets/roundButton.dart';
// import 'package:ya_mart/Widgets/roundButtonBorder.dart';

// import '../../../Resources/style_manager.dart';

// class BankDetailScreen extends StatefulWidget {
//   const BankDetailScreen({Key? key}) : super(key: key);

//   @override
//   State<BankDetailScreen> createState() => _BankDetailScreenState();
// }

// class _BankDetailScreenState extends State<BankDetailScreen> {
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

//   int _currentIndex = 2;
//   bool chkValue = false;
 

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
//                             ? ColorManager.darkGreen
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
//                               ? ColorManager.darkGreen
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
//                     
//                     child: Text(
//                       'Unable to fetch your full beneficiary name.please add Cancelled Cheque/Password for verification.',
//                       style: getregulartextStyle(
//                           fontSize: 13, color: Colors.black),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 55,
//             ),
//             SizedBox(
//               height: 300,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 5,
//                       child: SizedBox(
//                         height: 70,
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: '**********',
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
//                   Expanded(
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 5,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: '646766623',
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
//                   SizedBox(
//                     height: 5,
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Expanded(
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 5,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'KKBK0001244',
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
//                   SizedBox(
//                     height: 15,
//                   ),
//                   RoundButtonBorderWithIcon(icon: Iconss.up,
//                       title: 'Upload Cancelled Cheque/Passbook', onTap: () {}),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     'Cheque/Passbook should have business or trade name on it',
//                     textAlign: TextAlign.center,
//                     style:
//                         getregulartextStyle(fontSize: 13, color: Colors.grey),
//                   )
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
//                           builder: (context) => SupplierDetailScreen()));
//                 },
//                 loading: false),
//           ],
//         ),
//       ),
//     );
//   }
// }
