import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/style_manager.dart';

class SupplierHub extends StatefulWidget {
  const SupplierHub({super.key});

  @override
  State<SupplierHub> createState() => _SupplierHubState();
}

class _SupplierHubState extends State<SupplierHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      body: SafeArea(
        child: ListView(


          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(CupertinoIcons.back)),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'SUPPLIER HUB',
                      style:
                      getmediumtextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.banner), fit: BoxFit.fill)),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundButton(
                  title: 'Start Selling',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GstScreen()));
                  },
                  loading: false),
            )
          ],
        ),
      ),
    );
  }
}
