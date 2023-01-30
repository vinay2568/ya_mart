import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Widgets/Custom_button_border.dart';
import 'package:ya_mart/Widgets/roundButtonBorder.dart';

import '../../../Widgets/roundButton.dart';

class UploadCatalogs extends StatefulWidget {
  const UploadCatalogs({Key? key}) : super(key: key);

  @override
  State<UploadCatalogs> createState() => _UploadCatalogsState();
}

class _UploadCatalogsState extends State<UploadCatalogs> {
  bool showData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: ColorManager.appBackground,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                height: 137,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Images.banner1,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundButton(
                    title: "Upload Catalog", onTap: () {}, loading: true),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_circle_outlined,
                        size: 50,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Join free live training",
                              style: getmediumtextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                            Text(
                              "Get free live training on catalog upload\nwith a yamart expert",
                              style: getregulartextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showData = true;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Book Training now",
                                    style: getmediumtextStyle(
                                        fontSize: 16,
                                        color: ColorManager.appBtn),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.red,
                                    size: 20,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              showData
                  ? Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(Iconss.box1),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Increase orders with free\nrewards",
                                            style: getmediumtextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "1. Free 1200 Ad credits",
                                            style: getregulartextStyle(
                                                fontSize: 15,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                          ),
                                          Text(
                                            "2. Free Return",
                                            style: getregulartextStyle(
                                                fontSize: 15,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                          ),
                                          Text(
                                            "3. Free Catalog Manager",
                                            style: getregulartextStyle(
                                                fontSize: 15,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:80.0),
                                      child: CustomButtonWidget(
                                          title: 'See Rewards',
                                          onTap: () {},
                                          border: true,
                                          height: 37,
                                          width: 132,
                                          titleSize: 13),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 300,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Useful Links",
                                  style: getmediumtextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Learn to operate and grow your bussiness on\nYamart",
                                  style: getregulartextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 0.2,
                                            spreadRadius: 0.2,
                                            color: Colors.grey)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ImageIcon(
                                        AssetImage(Iconss.play),
                                        color: ColorManager.appBtn,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Prepare Catalog for yaamart",
                                        style: getregulartextStyle(
                                            fontSize: 15,
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.black.withOpacity(0.6),
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 0.2,
                                            spreadRadius: 0.2,
                                            color: Colors.grey)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.percent_outlined,
                                        color: ColorManager.appBtn,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Pricing & Commision",
                                        style: getregulartextStyle(
                                            fontSize: 15,
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.black.withOpacity(0.6),
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 8,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 0.2,
                                            spreadRadius: 0.2,
                                            color: Colors.grey)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ImageIcon(
                                        AssetImage(Iconss.car),
                                        color: ColorManager.appBtn,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Delivery and returns",
                                        style: getregulartextStyle(
                                            fontSize: 15,
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.black.withOpacity(0.6),
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
