import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/product_detail_title.dart';

import '../../../../Resources/assets_manager.dart';
import '../../../../Resources/style_manager.dart';
import '../../../../Widgets/Custom_button_border.dart';

class SoldByWidget extends StatelessWidget {
  String vendorName;
  String rating;
  String reviews;
  String followers;
  String products;
  VoidCallback viewAll;

  SoldByWidget(
      {Key? key,
      required this.viewAll,
      required this.vendorName,
      required this.rating,
      required this.reviews,
      required this.followers,
      required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: ColorManager.whiteColor),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductDetailPageTitle(
                    title: 'Sold by',
                  ),
                  CustomButtonWidget(
                      title: 'View Shop',
                      onTap: viewAll,
                      border: true,
                      height: 34,
                      width: 96,
                      titleSize: 15),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: ImageIcon(
                          AssetImage(Iconss.homefil),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(vendorName),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 54,
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
                              '$rating *',
                              style: getmediumtextStyle(
                                  fontSize: 16, color: Colors.black),
                            )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '($reviews) ratings',
                            style: getregulartextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(
                            followers,
                            style: getmediumtextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            'Followers',
                            style: getregulartextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(
                            products,
                            style: getmediumtextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            'Products',
                            style: getregulartextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}