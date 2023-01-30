import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/Widgets/center_tf.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/order_screen.dart';
import 'package:ya_mart/Widgets/Custom_button_border.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import '../../../network/api_helper.dart';
import '../../../network/loader.dart';
import 'edit_address.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  bool isLoading=false;
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
                MaterialPageRoute(builder: (context) => OrdersScreen()));
          },
          child: const Icon(
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
        child:
        isLoading?

            Center(
              child: Loader(),
            ):

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Select a delivery Address",
                    style:
                        getmediumtextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.66,
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                size: 35,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recently Used",
                                    style: getmediumtextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Pawan Kumar\n8/41 Chitrakot\nNear SBI Bank Nagar,\njaipur",
                                    style: getregulartextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Pawan Kumar\n8/41 Chitrakot\nNear SBI Bank Nagar,\nIndia\nPhone Number: 03445667778",
                                    style: getregulartextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RoundButton(
                              title: 'Deliver to this Address',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrdersScreen()));
                              },
                              loading: false),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CenterTf(
                              text: 'Edit address',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditAddress()));
                              },
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CenterTf(
                              text: 'Add a New Address',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditAddress()));
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  fetchAddress() async {
    setState(() {
      isLoading=true;
    });
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.getWithToken('ecom/customer/', context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    setState(() {
      isLoading=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAddress();
  }


}
