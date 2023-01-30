import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';

import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../Widgets/textfield1.dart';

class SupplierOrderScreen extends StatefulWidget {
  const SupplierOrderScreen({Key? key}) : super(key: key);

  @override
  State<SupplierOrderScreen> createState() => _SupplierOrderScreenState();
}

class _SupplierOrderScreenState extends State<SupplierOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.appBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Orders',
                          style: getTextStyle(16, FontweightManager.regular,
                              ColorManager.black),
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 11,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: const ImageIcon(AssetImage(Iconss.ques))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 0.2,
                          spreadRadius: 0.2,
                          color: Colors.grey)
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            AssetImage(
                              Iconss.play,
                            ),
                            color: ColorManager.appBtn,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Learn how to process your orders?",
                            style: getmediumtextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrderStatus(text: 'On Hold (0)',),
                        SizedBox(
                          width: 10,
                        ),
                        OrderStatus(text: 'Pending (0)'),
                        SizedBox(
                          width: 10,
                        ),
                        OrderStatus(text: 'Ready to ship'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: ColorManager.whiteColor,
                    height: 80,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InputTextField(
                            suffix: Icons.search, hinttext: "Search")),
                  ),
                  
                  Center(child: ImageIcon(AssetImage(Iconss.OrderSurp),size: 300,)),
                  Center(
                    child: Text(
                      "No Orders Yet",
                      style:
                          getregulartextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 10,),
                  
                  Center(
                    child: Text(
                      "But keep checking this section from time to time",
                      style:
                          getregulartextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ]),
          ),
        ));
  }
}

class OrderStatus extends StatelessWidget {
  String text;
  OrderStatus({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 0.2,
              spreadRadius: 0.3,
              color: Colors.grey),
        ]),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: getmediumtextStyle(
                fontSize: 15,
                color: text == 'Ready to ship' ? Colors.grey : Colors.black),
          ),
        ),
      ),
    );
  }
}
