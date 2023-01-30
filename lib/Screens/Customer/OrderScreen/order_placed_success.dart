import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/order_screen.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/track_order_screen.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/style_manager.dart';

class OrderPlacedSuccess extends StatefulWidget {
  const OrderPlacedSuccess({super.key});

  @override
  State<OrderPlacedSuccess> createState() => _OrderPlacedSuccessState();
}

class _OrderPlacedSuccessState extends State<OrderPlacedSuccess> {
  late String method = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrdersScreen()));
                        },
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(Iconss.tick),
                        color: ColorManager.darkGreen,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Order placed, thank you!',
                        style: getmediumtextStyle(
                            fontSize: 21, color: ColorManager.darkGreen),
                      ),
                    ],
                  ),
                  Text(
                    'Confirmation will be sent to your email.',
                    style: getregulartextStyle(
                        fontSize: 17, color: ColorManager.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Shipping to Pawan kumar',
                          style: getmediumtextStyle(
                            fontSize: 17,
                            color: ColorManager.black,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    ', 8/41 Chitrakoot \nNear SBI Bank Vashali Nagar, Jaipur,phone number: 1234564321',
                                style: getregulartextStyle(
                                    fontSize: 17, color: ColorManager.black))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: Divider(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Wednesday, 28 Dec',
                                style: getmediumtextStyle(
                                  fontSize: 17,
                                  color: ColorManager.black,
                                ),
                              ),
                              Text(
                                'Estimated delivery',
                                style: getregulartextStyle(
                                  fontSize: 17,
                                  color: ColorManager.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TrackOrderScreen()));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 40,
                                      color: ColorManager.darkGrey,
                                    ),
                                    Text(
                                      'Estimated delivery',
                                      style: getregulartextStyle(
                                        fontSize: 15,
                                        color: ColorManager.appBtn,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: 73,
                            height: 79,
                            decoration: BoxDecoration(
                                color: ColorManager.grey,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(Images.redShirt),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
