import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/pickup_address_form.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import '../../../Resources/style_manager.dart';

class AccountDetails extends StatefulWidget {
  String gstNumber;
  String businessName;
  String panNumber;
  String businessType;
  String businessAddress;
  AccountDetails(this.gstNumber,this.businessName,this.panNumber,this.businessType,this.businessAddress);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
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

  int _currentIndex = 0;
  bool chkValue = true;
   bool gstDetails = true;
   var gstController=TextEditingController();

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
                          color: _currentIndex == index && gstDetails == true
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
                            color: _currentIndex == index && gstDetails == true
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
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: TextFormField(
                        enabled: false,
                        controller: gstController,
                        decoration: InputDecoration(
                          hintText: 'PAN Number',
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.darkGreen, width: 1),
                    ),
                    width: 24,
                    height: 24,
                    child: Theme(
                      data: ThemeData(
                          unselectedWidgetColor: ColorManager.darkGreen),
                      child: Checkbox(
                        checkColor: ColorManager.darkGreen,
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
                  Text(
                    "Verify",
                    style: getmediumtextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
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
                          'GSTIN',
                          style: getregulartextStyle(
                              fontSize: 14, color: Color(0xFF4c4e4f)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.gstNumber,
                          style: getmediumtextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Business Name',
                          style: getregulartextStyle(
                              fontSize: 14, color: Color(0xFF4c4e4f)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.businessName,
                          style: getmediumtextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'PAN Number',
                          style: getregulartextStyle(
                              fontSize: 14, color: Color(0xFF4c4e4f)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.panNumber,
                          style: getmediumtextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Business Type',
                          style: getregulartextStyle(
                              fontSize: 14, color: Color(0xFF4c4e4f)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.businessType,
                          style: getmediumtextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Registered Business Address',
                          style: getregulartextStyle(
                              fontSize: 14, color: Color(0xFF4c4e4f)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.businessAddress,
                           style: getmediumtextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RoundButton(
                  title: 'Continue',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PickupAddressForm()));
                  },
                  loading: false),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gstController.text=widget.gstNumber;
  }
}
