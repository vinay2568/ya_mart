import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/fonts_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Screens/Customer/Home/product_detail_Screen.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/circle_Categories_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/low_price_Store.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/search_widget.dart';

class PopularForYouWidget extends StatelessWidget {
  String img;
  String title;
  String price;
  String rating;
  String reviews;
  VoidCallback itemTap;
  VoidCallback favTap;
  PopularForYouWidget({
    required this.img,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.itemTap,
    required this.favTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       /* Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ProductDetailScreen()));*/
      },
      child: Container(
        height: 266,
        width: 178,
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Image.asset(
                  img,
                  height: 143,
                  width: 122,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: title + '\n',
                          style: TextStyle(
                              color: ColorManager.black,
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: '₹'+ price,
                          style: TextStyle(
                              color: ColorManager.darkblue,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500)),
                    ]),
                  ),
                  GestureDetector(
                    onTap: favTap,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('Free Delivery',
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 10,
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
                      child: Text(rating + '*',
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
                  Text('(' + reviews + ')',
                      style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 11,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
