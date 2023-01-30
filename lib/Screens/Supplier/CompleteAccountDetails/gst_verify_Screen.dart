import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_details_screen.dart';
import 'package:ya_mart/Screens/Supplier/supplier_hub.dart';
import 'package:ya_mart/utils/app_modal.dart';

import '../../../Resources/color_manager.dart';
import '../../../Widgets/roundButton.dart';
import '../../../Widgets/textfield.dart';
import '../../../network/api_dialog.dart';
import '../../../network/api_helper.dart';

class GstScreen extends StatefulWidget {
  const GstScreen({Key? key}) : super(key: key);

  @override
  State<GstScreen> createState() => _GstScreenState();
}

class _GstScreenState extends State<GstScreen> {
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
  final _formKey = GlobalKey<FormState>();

  int _currentIndex = 0;

  bool chkValue = true;
  var gstNumberController=TextEditingController();
  bool isVerified=false;
  String gstNumber='';
  String businessName='';
  String panNumber='NA';
  String businessType='';
  String businessAddress='';


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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
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

              Text(
                'GST number is required to sell on Yam art',
                style: getmediumtextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Because the government needs all the suppliers to provide their GST number to sell online',
                style: getregulartextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4c4e4f)),
              ),
              SizedBox(
                height: 30,
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: gstNumberController,
                        validator: (value) =>
                        value!.isEmpty || value.length!=15 ? "Enter a valid GST Number" : null,
                        decoration: InputDecoration(
                          hintText: 'Enter GSTIN',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 120,
                      height: 48,
                      child: RoundButton(title: 'Verify', onTap: (){

                        _submitHandler(context);


                       }, loading: false))



                ],
              ),

              Spacer(),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(title: 'Continue', onTap: (){
                  if(isVerified)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountDetails(gstNumber,businessName,panNumber,businessType,businessAddress)));
                    }

                }, loading: false),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),

        ),
      ));
  }

  void _submitHandler(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    validateGST(context);
  }
  validateGST(BuildContext context) async {
    FocusScope.of(context).unfocus();
    APIDialog.showAlertDialog(context, 'Validating GST...');
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.getAPI('http://sheet.gstincheck.co.in/check/6274bd35e613126acb031d69aa53361b/'+gstNumberController.text, context);
    Navigator.pop(context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);

    if(responseJSON['flag']==true)
      {
        isVerified=true;
        Toast.show('Verified successfully !',
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.green);
        gstNumber=responseJSON['data']['gstin'];
        businessName=responseJSON['data']['lgnm'];
        businessType=responseJSON['data']['ctb'];
        businessAddress=responseJSON['data']['pradr']['adr'];

        AppModel.setgstNumberValue(gstNumber);
        AppModel.setbusinessNameValue(businessName);
        AppModel.setbusinessTypeValue(businessType);
        AppModel.setbusinessAddressValue(businessAddress);
        
        AppModel.setBuildingValue(responseJSON['data']['pradr']['addr']['loc']);
        AppModel.setStreetValue(responseJSON['data']['pradr']['addr']['st']);
        AppModel.setLandmarkValue('NA');
        AppModel.setPincodeValue(responseJSON['data']['pradr']['addr']['pncd'].toString());
        AppModel.setCityValue(responseJSON['data']['pradr']['addr']['city']);
        AppModel.setStateNameValue(responseJSON['data']['pradr']['addr']['stcd']);

        
        



      }
    else
      {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }



    /*else {
      Toast.show(responseJSON['errors'].toString(),
          duration: Toast.lengthLong,
          gravity: Toast.bottom,
          backgroundColor: Colors.red);
    }*/
  }
}
