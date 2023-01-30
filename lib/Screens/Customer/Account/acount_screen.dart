import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ya_mart/Screens/Supplier/supplier_hub.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account',
                      style: getTextStyle(
                          16, FontweightManager.regular, ColorManager.black),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.favorite_outline)),
                    const SizedBox(
                      width: 11,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.shopping_cart_outlined)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageIcon(
                        AssetImage(
                          Iconss.accountCircle,
                        ),
                        size: 64,
                        color: ColorManager.darkblue,
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      Text(
                        'Name',
                        style: getsemiboldtextStyle(
                            fontSize: 20, color: Colors.black),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.forward,
                        color: Colors.grey,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageIcon(
                        AssetImage(
                          Iconss.haedphone,
                        ),
                        size: 50,
                        color: ColorManager.darkblue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Support & help',
                        style: getmediumtextStyle(
                            fontSize: 16, color: Colors.grey),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              AccountWidget(
                title: 'Bank & UPI Details',
                icon: Iconss.bank,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Shared Products',
                icon: Iconss.share,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'View Products',
                icon: Iconss.timer,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Payments',
                icon: Iconss.payments,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Become a Supplier',
                icon: Iconss.box,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SupplierHub()));
                },
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Rate Us',
                icon: Iconss.star,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Settings',
                icon: Iconss.setting,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Legal and Policies',
                icon: Iconss.calender,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  String title;
  String icon;
  VoidCallback onTap;
  AccountWidget(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 54,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(
                  AssetImage(icon),
                  size: 50,
                  color: ColorManager.darkblue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: getmediumtextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
