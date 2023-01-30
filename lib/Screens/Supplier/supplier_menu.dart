import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ya_mart/Screens/Supplier/supplier_hub.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';

class SupplierMenuScreen extends StatefulWidget {
  const SupplierMenuScreen({super.key});

  @override
  State<SupplierMenuScreen> createState() => _SupplierMenuScreenState();
}

class _SupplierMenuScreenState extends State<SupplierMenuScreen> {
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
                      'Menu',
                      style: getTextStyle(
                          16, FontweightManager.regular, ColorManager.black),
                    ),
                    const Spacer(),
                    
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
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageIcon(
                        AssetImage(
                          Iconss.accountCircle,
                        ),
                        size: 54,
                        color: ColorManager.darkblue,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                            'ATS global tech',
                            style: getmediumtextStyle(fontSize: 18, color: ColorManager.black)
                          ),
                          Row(
                            children: [
                              Container(
                                width: 59,
                                height: 28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorManager.whiteColor,
                                  border: Border.all(),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child: Text(
                                  '3.7 *',
                                  style: getmediumtextStyle(
                                      fontSize: 16, color: Colors.black),
                                )),
                              ),

                              SizedBox(width: 10,),
                              Text(
                                '0 Ratings',
                                style: getregulartextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                              
                              SizedBox(width: 10,),
                              Text(
                                '0 Followers',
                                style: getregulartextStyle(
                                    fontSize: 13, color: Colors.black),
                              )
                            ],
                          )
                        
                          ],
                        ),
                      ),
                      Icon(
                        CupertinoIcons.forward,
                        color: Colors.grey,
                        size: 30,
                      ),
                      Spacer(),
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
                          Iconss.box,
                        ),
                        size: 50,
                        color: ColorManager.darkblue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'My Shop',
                        style: getmediumtextStyle(
                            fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      Text(
                        'Yamart.com/ATSglobaltech',
                        style: getregulartextStyle(
                            fontSize: 10, color: ColorManager.appBtn),
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
                height: 21,
              ),
              AccountWidget(
                title: 'Orders',
                icon: Iconss.bank,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Inventory',
                icon: Iconss.supInventory,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Catalog Upload',
                icon: Iconss.up,
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
                title: 'Advertisement',
                icon: Iconss.mic,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SupplierHub()));
                },
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Support',
                icon: Iconss.ques,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Notice Board',
                icon: Iconss.bell,
                onTap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              AccountWidget(
                title: 'Learning Hub',
                icon: Iconss.play,
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
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: getmediumtextStyle(fontSize: 16, color: Colors.grey),
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
      ),
    );
  }
}
