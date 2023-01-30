import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/Widgets/center_tf.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/delivery_address.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/order_screen.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import '../../../Widgets/Custom_button_border.dart';
import 'Widgets/drop_down.dart';
import 'Widgets/text_field.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DeliveryAddress()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()));
            },
            child: const Text(
              "CANCEL",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Edit your address",
                style: getmediumtextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: CenterTf(
                  onTap: () {},
                  text: 'Use current location',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "OR",
                style: getmediumtextStyle(color: Colors.black, fontSize: 16),
              )),
              SizedBox(
                height: 10,
              ),
              DropDown(text: "India"),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(text: "Full Name"),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(text: "Mobile Number"),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(text: "PinCode"),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(text: "Flat House_no, Building, company"),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(text: "Area, streat, Sector, village"),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(text: "Land Mark"),
              SizedBox(
                height: 10,
              ),
              CustomTextfield(text: "Town/City"),
              SizedBox(
                height: 10,
              ),
              DropDown(text: "State"),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.green,
                      tristate: true,
                      onChanged: (newbool) {
                        setState(() {
                          isChecked = newbool;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Make this my default address",
                      style: getregulartextStyle(
                          color: Colors.grey.shade600, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RoundButton(
                title: "Use this address",
                onTap: () {},
                loading: false,
              ),

              SizedBox(height: 20,)
            ]),
          ),
        ),
      ),
    );
  }
}
