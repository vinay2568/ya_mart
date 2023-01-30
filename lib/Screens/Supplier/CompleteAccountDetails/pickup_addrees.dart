import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/pickup_address_form.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/verify_bank.dart';
import 'package:ya_mart/Widgets/roundButton.dart';
import 'package:ya_mart/Widgets/roundButtonBorder.dart';

import '../../../Resources/style_manager.dart';
import '../../../utils/app_modal.dart';

class PickupAddressScreen extends StatefulWidget {
  const PickupAddressScreen({Key? key}) : super(key: key);

  @override
  State<PickupAddressScreen> createState() => _PickupAddressScreenState();
}

class _PickupAddressScreenState extends State<PickupAddressScreen> {
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

  int _currentIndex = 1;
  bool chkValue = true;

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorManager.appBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GstScreen()));
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(iconList.length, (index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    height: 100,
                    width: 85,
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
                      width: 80,
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
                  Icons.check_box_outlined,
                  color: ColorManager.midGreen.withOpacity(0.60),
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  
                  color: ColorManager.midGreen.withOpacity(0.60),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Pick up address updated successfully',
                    style: getregulartextStyle(
                        fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),
              
              
              SizedBox(
                height: 47,
              ),
              Row(
                children: [
                  Container(
                    height: 350,
                    width: 2,
                    color: Color(0xFF73B46A),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        'Room/ Floor/ Building Number',
                        style: getregulartextStyle(
                            fontSize: 14, color: Color(0xFF4c4e4f)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppModel.building,
                        style: getmediumtextStyle(
                            fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Street/ Locality',
                        style: getregulartextStyle(
                            fontSize: 14, color: Color(0xFF4c4e4f)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppModel.street,
                        style: getmediumtextStyle(
                            fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Landmark',
                        style: getregulartextStyle(
                            fontSize: 14, color: Color(0xFF4c4e4f)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppModel.landmark,
                        style: getmediumtextStyle(
                            fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Pincode',
                        style: getregulartextStyle(
                            fontSize: 14, color: Color(0xFF4c4e4f)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppModel.pincode,
                        style: getmediumtextStyle(
                            fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'City',
                        style: getregulartextStyle(
                            fontSize: 14, color: Color(0xFF4c4e4f)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppModel.city,
                        style: getmediumtextStyle(
                            fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'State',
                        style: getregulartextStyle(
                            fontSize: 14, color: Color(0xFF4c4e4f)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppModel.stateName,
                        style: getmediumtextStyle(
                            fontSize: 15, color: Colors.black),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 83,
              ),
              RoundButtonBorder(title: "Edit Pickup Address", onTap: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PickupAddressForm()));
            }),
        
            SizedBox(height: 10,),
            RoundButton(
                title: 'Continue',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyBankScreen()));
                },
                loading: false),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),











      // backgroundColor: ColorManager.appBackground,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (context) => GstScreen()));
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.black,
      //     ),
      //   ),
      //   title: Text(
      //     "Complete Account Details",
      //     style: getmediumtextStyle(fontSize: 18, color: Colors.black),
      //   ),
      //   actions: [
      //     Center(
      //       child: GestureDetector(
      //         onTap: () {},
      //         child: Text(
      //           "Help?",
      //           style: getmediumtextStyle(
      //               fontSize: 16, color: ColorManager.appBtn),
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //   ],
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       SizedBox(
      //         height: 5,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: List.generate(iconList.length, (index) {
      //           return Container(
      //             padding: EdgeInsets.all(5),
      //             height: 100,
      //             width: 85,
      //             color: Colors.white,
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 ImageIcon(
      //                   AssetImage(imgList[index]),
      //                   color: _currentIndex == index
      //                       ? ColorManager.darkGreen
      //                       : Color(0xFF4c4e4f),
      //                   size: 30,
      //                 ),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Text(
      //                   titleList[index],
      //                   textAlign: TextAlign.center,
      //                   style: getregulartextStyle(
      //                     fontSize: 16,
      //                     color: _currentIndex == index
      //                         ? ColorManager.darkGreen
      //                         : Color(0xFF4c4e4f),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Container(
      //         height: 10,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: List.generate(iconList.length, (index) {
      //             return Container(
      //               height: 10,
      //               width: 80,
      //               decoration: BoxDecoration(
      //                 color: _currentIndex == index
      //                     ? Color(0xFFf63e08)
      //                     : Colors.white,
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //             );
      //           }),
      //         ),
      //       ),
        
            
      //       SizedBox(
      //         height: 30,
      //       ),
      //       Row(
      //         children: [
      //           Icon(
      //             Icons.check_box_outlined,
      //             color: ColorManager.midGreen.withOpacity(0.60),
      //             size: 30,
      //           ),
      //           SizedBox(
      //             width: 5,
      //           ),
      //           Expanded(
      //             child: Container(
      //               padding: EdgeInsets.all(10),
      //               height: 40,
      //               color: ColorManager.midGreen.withOpacity(0.60),
      //               width: 10,
      //               child: Text(
      //                 'Pick up address updated successfully',
      //                 style: getregulartextStyle(
      //                     fontSize: 13, color: Colors.black),
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
        
      //       SizedBox(height: 30,),

      //       Row(
      //         children: [

      //           Container(width: 10,
      //           height: 350,
      //           color: ColorManager.darkGreen,
      //           ),

      //         ],
      //       ),
            
            
            
      //       Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //             height: 380,
      //               color: ColorManager.midGreen.withOpacity(0.60),
                    
      //             ),
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Expanded(
      //             flex: 9,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   'Room/ Floor/ Building Number',
      //                   style: getregulartextStyle(
      //                       fontSize: 14, color: Color(0xFF4c4e4f)),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   '208, 2ND FLOOR, AVOID, NIRMAL GALAXY',
      //                   style: getmediumtextStyle(
      //                       fontSize: 15, color: Colors.black),
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Text(
      //                   'Street/ Locality',
      //                   style: getregulartextStyle(
      //                       fontSize: 14, color: Color(0xFF4c4e4f)),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   'LBS MARG, MULUND W',
      //                   style: getmediumtextStyle(
      //                       fontSize: 15, color: Colors.black),
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Text(
      //                   'Landmark',
      //                   style: getregulartextStyle(
      //                       fontSize: 14, color: Color(0xFF4c4e4f)),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   '-',
      //                   style: getmediumtextStyle(
      //                       fontSize: 15, color: Colors.black),
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Text(
      //                   'Pincode',
      //                   style: getregulartextStyle(
      //                       fontSize: 14, color: Color(0xFF4c4e4f)),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   '400080',
      //                   style: getmediumtextStyle(
      //                       fontSize: 15, color: Colors.black),
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Text(
      //                   'City',
      //                   style: getregulartextStyle(
      //                       fontSize: 14, color: Color(0xFF4c4e4f)),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Mumbai Suburban",
      //                   style: getmediumtextStyle(
      //                       fontSize: 15, color: Colors.black),
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Text(
      //                   'State',
      //                   style: getregulartextStyle(
      //                       fontSize: 14, color: Color(0xFF4c4e4f)),
      //                 ),
      //                 SizedBox(
      //                   height: 5,
      //                 ),
      //                 Text(
      //                   "Maharashtra",
      //                   style: getmediumtextStyle(
      //                       fontSize: 15, color: Colors.black),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //       Spacer(),
      //       RoundButtonBorder(title: "Edit Pickup Address", onTap: (){
      //         Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => PickupAddressForm()));
      //       }),
        
      //       SizedBox(height: 10,),
      //       RoundButton(
      //           title: 'Continue',
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => VerifyBankScreen()));
      //           },
      //           loading: false),
      //     ],
      //   ),
      // ),
    );
  }
}
