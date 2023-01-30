import 'package:flutter/material.dart';
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
import '../../Customer/AuthenticationScreens/SignIn_Screen.dart';

class PickupAddressForm extends StatefulWidget {
  const PickupAddressForm({super.key});

  @override
  State<PickupAddressForm> createState() => _PickupAddressFormState();
}

class _PickupAddressFormState extends State<PickupAddressForm> {
  final buildingController = TextEditingController();
  final streetController = TextEditingController();
  final pinCodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  bool gstAddress=false;
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

  Widget _pinCode() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: emptyStringValidator,
        controller: pinCodeController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Pin code",
        ),
      ),
    );
  }

  Widget _city() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          controller: cityController,
          validator: (value) =>
              value!.isEmpty ? "City name cannot be empty" : null,
          style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
          decoration: _buildInputDecoration(
            "City",
          ),
        ));
  }

  Widget _roomFloorBuilding() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: buildingController,
        validator: emptyStringValidator,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Room/ Floor/ Building Number",
        ),
      ),
    );
  }

  Widget _StreetLocalityLandmark() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: emptyStringValidator,
        controller: streetController,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "Street/ Locality/ Landmark",
        ),
      ),
    );
  }

  Widget _state() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: stateController,
        validator: emptyStringValidator,
        style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
        decoration: _buildInputDecoration(
          "State",
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
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
        body: Form(
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
                          'Product will be picked up from this location for delivery',
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

                            if(chkValue)
                              {
                                fillData();
                              }


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
                ),
                SizedBox(
                  height: 20,
                ),
                _roomFloorBuilding(),
                SizedBox(
                  height: 10,
                ),
                _StreetLocalityLandmark(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(child: _pinCode()),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _city()),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                _state(),
                SizedBox(
                  height: 20,
                ),
                RoundButton(
                    title: 'Continue',
                    onTap: () {
                      _submitHandler();

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
        ));
  }
  void _submitHandler() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PickupAddressScreen()));
  }

  fillData(){

    buildingController.text=AppModel.building;
    streetController.text=AppModel.street;
    pinCodeController.text=AppModel.pincode;
    cityController.text=AppModel.city;
    stateController.text=AppModel.stateName;

    setState(() {

    });
  }
  String? phoneValidator(String? value) {
    if (value!.toString().length!=6) {
      return 'Enter a valid Pin code';
    }
    return null;
  }
  String? emptyStringValidator(String? value) {
    if (value!.isEmpty) {
      return 'Cannot be left empty';
    }
    return null;
  }
}










// class PickupAddressForm extends StatefulWidget {
//   const PickupAddressForm({Key? key}) : super(key: key);

//   @override
//   State<PickupAddressForm> createState() => _PickupAddressFormState();
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.appBackground,
//       appBar: AppBar(
        
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
                        
//             Spacer(),
            
//           ],
//         ),
//       ),
//     );
//   }
// }
