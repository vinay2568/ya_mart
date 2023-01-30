import 'package:flutter/material.dart';

import '../../../../Resources/color_manager.dart';
import '../../../../Resources/style_manager.dart';

class ProductRatings extends StatelessWidget {
  const ProductRatings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: SizedBox(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      offset: Offset(0,
                          2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  '3.9 *',
                  style: getmediumtextStyle(
                      fontSize: 16, color: Colors.black),
                )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '2,704 ratings',
                style: getregulartextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 10),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '433 reviews',
                style: getregulartextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 10),
              ),
            ],
          ),
        ));
  }
}