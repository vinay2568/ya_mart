import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Screens/Supplier/SupplierDashboard/upoad_catalogs.dart';

import '../../../Widgets/tab_bar.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
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
                height: 50,
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
                            "Welcome ATS global tech",
                            style: getsemiboldtextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          ImageIcon(
                            AssetImage(
                              Iconss.ques,
                            ),
                            color: Colors.black,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Let’s get your business started in 3 steps",
                            style: getmediumtextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                    tabbarTabs(
                      text: "1",
                      title: 'Upload\nCatalogs',
                    ),
                    tabbarTabs(
                      text: "2",
                      title: 'Catalogs\ngo live',
                    ),
                    tabbarTabs(
                      text: "3",
                      title: 'Get first\norder',
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  UploadCatalogs(),
                  Center(
                    child: Text('Catalogs Go Live Screen '),
                  ),
                  Center(
                    child: Text('Get First Order Screen '),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
