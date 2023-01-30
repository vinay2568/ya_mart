import 'package:flutter/material.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/product_detail_title.dart';

import '../../../../Resources/color_manager.dart';
import '../../../../Resources/style_manager.dart';

class ProductDescriptionWidget extends StatelessWidget {
  String name;
  String fabric;
  String sleeveLength;
  String pattern;
  String netQuantity;
  String sizes;
  String country;
  VoidCallback moreTap;

  VoidCallback copyTap;

  VoidCallback readLessTap;
  ProductDescriptionWidget(
      {Key? key,
      required this.sizes,
      required this.name,
      required this.fabric,
      required this.sleeveLength,
      required this.country,
      required this.netQuantity,
      required this.pattern,
      required this.moreTap,
      required this.readLessTap,
      required this.copyTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        width: MediaQuery.of(context).size.width,
        color: ColorManager.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailPageTitle(
                    title: 'Product Details',
                  ),
                  GestureDetector(
                    onTap: copyTap,
                    child: Text('COPY',
                        style: getsemiboldtextStyle(
                          fontSize: 12,
                          color: ColorManager.appBtn,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Name: $name',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              Text('Fabric: $fabric',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              Text('Sleeve Length: $sleeveLength',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              Text('Pattern: $pattern',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              Text('Net Quantity (N): $netQuantity',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              Text('Sizes: $sizes',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              const Spacer(),
              Text('COTTON CHECK SHIRTS',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              Text('Country of Origin:$country',
                  style: getregulartextStyle(
                    fontSize: 12,
                    color: ColorManager.black,
                  )),
              const Spacer(),
              GestureDetector(
                onTap: moreTap,
                child: Text('More information',
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorManager.black,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter')),
              ),
              const Spacer(),
              GestureDetector(
                onTap: readLessTap,
                child: Text('Read Less',
                    style: getregulartextStyle(
                      fontSize: 12,
                      color: ColorManager.appBtn,
                    )),
              ),
            ],
          ),
        ));
  }
}
