import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../Resources/color_manager.dart';



class ProductDetailWidget extends StatelessWidget {
  String img;
  String title;
  String price;
  String rating;
  String reviews;
  VoidCallback shareTap;
  ProductDetailWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.shareTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 410,
            color: ColorManager.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 276,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          img,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //
                  Text(
                    title,
                    style: TextStyle(
                        color: ColorManager.darkGrey,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹' + price,
                        style: TextStyle(
                            color: ColorManager.darkblue,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                              onTap: shareTap, child: Icon(Icons.share)),
                          Text(
                            'Share',
                            style: TextStyle(
                                color: ColorManager.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text('Free Delivery',
                      style: TextStyle(
                          color: ColorManager.darkGrey,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 29,
                        width: 59,
                        decoration: BoxDecoration(
                          color: ColorManager.darkblue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(rating + ' *',
                              style: TextStyle(
                                  color: ColorManager.whiteColor,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('(' + reviews + ') ratings',
                          style: TextStyle(
                              color: ColorManager.darkGrey,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

