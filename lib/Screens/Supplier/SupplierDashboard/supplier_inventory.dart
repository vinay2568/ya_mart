import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Screens/Supplier/SupplierDashboard/upoad_catalogs.dart';

import '../../../Widgets/Custom_button_border.dart';
import '../../../Widgets/tab_bar.dart';

class SupplierInventoryScreen extends StatefulWidget {
  const SupplierInventoryScreen({Key? key}) : super(key: key);

  @override
  State<SupplierInventoryScreen> createState() =>
      _SupplierInventoryScreenState();
}

class _SupplierInventoryScreenState extends State<SupplierInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorManager.appBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: ColorManager.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Inventory",
                            style: getsemiboldtextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          Spacer(),
                          Icon(
                            Icons.search,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ImageIcon(
                            AssetImage(
                              Iconss.ques,
                            ),
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 15,
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
                  Container(
                    height: 80,
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
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Upload new catalog here",
                            style: getmediumtextStyle(
                                fontSize: 17, color: Colors.black),
                          ),
                          Spacer(),
                          CustomButtonWidget(
                              title: 'Upload',
                              onTap: () {},
                              border: true,
                              height: 37,
                              width: 89,
                              titleSize: 13),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Container(
                height: 110,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: TabBar(
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 10,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 10,
                      color: Colors.red,
                    ),
                  ),
                  tabs: [
                    tabbarTabs1(
                      text: "Active (0)",
                    ),
                    tabbarTabs1(
                      text: "Activation\nPending (0)",
                    ),
                    tabbarTabs1(
                      text: "Blocked (0)",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CatalogStatus(text: 'All Stock (0)'),
                    SizedBox(
                      width: 10,
                    ),
                    CatalogStatus(text: 'Out of Stock (0)'),
                    SizedBox(
                      width: 10,
                    ),
                    CatalogStatus(text: 'Low Stock (0)'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: ColorManager.whiteColor,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(width: 1, color: Colors.black),
                        ),
                        color: ColorManager.whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.repeat,
                            size: 39,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Sort',
                            style: getregulartextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(width: 1, color: Colors.black),
                          ),
                          color: ColorManager.whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              size: 39,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Filter',
                              style: getregulartextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  CatalogScreen(),
                  CatalogScreen(),
                  CatalogScreen(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Column(
        children: [
          Center(
              child: ImageIcon(
            AssetImage(Iconss.OrderSurp),
            size: 50,
          )),
          Center(
            child: Text(
              "No Catalogs",
              style: getmediumtextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "But keep checking this section from time to time",
              style: getregulartextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogStatus extends StatelessWidget {
  String text;
  CatalogStatus({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
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
                color: text == 'All Stock (0)'
                    ? ColorManager.appBtn
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
