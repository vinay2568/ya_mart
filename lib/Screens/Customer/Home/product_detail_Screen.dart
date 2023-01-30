import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/product_decription_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/product_detail_title.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/product_detail_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/product_size_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/review_stats_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/similar_products_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/slod_by_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/total_rating_reviews.dart';
import 'package:ya_mart/Widgets/Custom_button_border.dart';
import 'package:ya_mart/network/api_dialog.dart';
import 'package:ya_mart/network/constants.dart';
import 'package:ya_mart/network/loader.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../network/api_helper.dart';

class ProductDetailScreen extends StatefulWidget {
  int id;
  ProductDetailScreen(this.id);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isLoading=false;
  Map<String,dynamic> productData={};
  List<dynamic> reviews=[];
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      body:
      isLoading?
          Center(
            child: Loader(),
          ):

      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DynamicScreen()));
                      },
                      child: Icon(CupertinoIcons.back)),
                  Spacer(),
                  Icon(Icons.search),
                  SizedBox(
                    width: 11,
                  ),
                  Icon(Icons.favorite_outline),
                  SizedBox(
                    width: 11,
                  ),
                  Icon(Icons.shopping_cart_outlined),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Product Detail would be here like price ,similar products,rating ,reviews etc
            Container(
              width: MediaQuery.of(context).size.width,
              height: 466,
              decoration: BoxDecoration(color: ColorManager.whiteColor),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('3 Similar Products'),
                        Spacer(),
                        Icon(Icons.favorite_outline),
                        SizedBox(
                          width: 11,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                              SizedBox(
                                height: 410,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      SimilarShirtWidget(
                                        img: Images.brownShirt,
                                        ontap: () {},
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SimilarShirtWidget(
                                        img: Images.redShirt,
                                        ontap: () {},
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SimilarShirtWidget(
                                        img: Images.greenShirt,
                                        ontap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: ProductDetailWidget(
                                  img: AppConstant.imageBaseURL+productData['image_1'],
                                  title: productData['title'],
                                  price: productData['discount_price'].toString(),
                                  rating: productData['ratings'].toString(),
                                  reviews: reviews.length.toString(),
                                  shareTap: () {},
                                ),
                              ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //       // Product Size Details

            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: ColorManager.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Size',
                        style: getmediumtextStyle(
                            color: ColorManager.black, fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizeContainerWidget(
                            width: 53,
                            size: 'M',
                          ),
                          SizeContainerWidget(
                            width: 53,
                            size: 'L',
                          ),
                          SizeContainerWidget(
                            width: 73,
                            size: 'XL',
                          ),
                          SizeContainerWidget(
                            width: 77,
                            size: 'XXL',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // Product Description Details

            ProductDescriptionWidget(
                copyTap: () {},
                readLessTap: () {},
                moreTap: () {},
                sizes: 'XL (Chest Size: 45 in, Length Size: 32 in )',
                name: productData['title'],
                fabric: 'NA',
                sleeveLength: 'NA',
                country: 'India',
                netQuantity: '1',
                pattern: 'NA'),
            const SizedBox(
              height: 30,
            ),
            //       // Product Sold By Details

            SoldByWidget(
                viewAll: () {},
                vendorName: 'Flannel',
                rating: '3.9',
                reviews: '7,333',
                followers: '155',
                products: '29'),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailPageTitle(title: 'Product Ratings & Reviews'),
                    Row(
                      children: [
                        ProductRatings(),
                        ReviewsStats(),
                      ],
                    ),
                    Divider(
                      color: ColorManager.darkGrey,
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage(Iconss.accountCircle),
                          size: 50,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Vivek Kumar\n',
                                style: getmediumtextStyle(
                                    fontSize: 14, color: ColorManager.black),
                                children: [
                              TextSpan(
                                  text: '112 helpfuls',
                                  style: getmediumtextStyle(
                                      fontSize: 12,
                                      color: ColorManager.darkGrey))
                            ])),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 34,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorManager.whiteColor,
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                            '5 *',
                            style: getmediumtextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Excelent',
                          style: getmediumtextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.black.withOpacity(0.4),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Posted on 16 nov, 2022',
                          style: getregulartextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 10),
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 64,
                          height: 69,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Images.blue2),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(12),
                            color: ColorManager.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        Container(
                          width: 64,
                          height: 69,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Images.redShirt),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(12),
                            color: ColorManager.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage(Iconss.like),
                          size: 40,
                        ),
                        Text('Helpful (109)',
                            style: getregulartextStyle(
                              fontSize: 12,
                              color: ColorManager.darkGrey,
                            ))
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'VIEW ALL REVIEWS',
                          style: getmediumtextStyle(
                              fontSize: 14, color: ColorManager.appBtn),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.forward,
                          size: 20,
                          color: ColorManager.appBtn,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 198,
              padding: EdgeInsets.all(10),
              color: ColorManager.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailPageTitle(title: 'Check Delivery Date'),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Form(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorManager.whiteColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Enter Delivery Pincode',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: ColorManager.whiteColor)),
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        )),
                      ),
                      Expanded(
                          child: Text(
                        'CHECK',
                        style: getmediumtextStyle(
                            fontSize: 13, color: ColorManager.appBtn),
                      ))
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(Iconss.car),
                        size: 20,
                        color: ColorManager.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Enter Pincode for Estimated Delivery Date',
                        style: getmediumtextStyle(
                            fontSize: 12, color: ColorManager.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(Iconss.calender),
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Dispatch in 2 day',
                        style: getmediumtextStyle(
                            fontSize: 12, color: ColorManager.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
                  SizedBox(
                    height: 31,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 92,
                    padding: EdgeInsets.all(10),
                    color: ColorManager.darkGrey,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(Iconss.tag),
                                size: 30,
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                'Lowest Price',
                                style: getsemiboldtextStyle(
                                    fontSize: 10, color: ColorManager.black),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(Iconss.bcar),
                                size: 30,
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                'Cash on Delivery',
                                style: getsemiboldtextStyle(
                                    fontSize: 10, color: ColorManager.black),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(Iconss.arrow),
                                size: 30,
                                color: Colors.black.withOpacity(0.4),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                '7 -day Returns',
                                style: getsemiboldtextStyle(
                                    fontSize: 10, color: ColorManager.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 31,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 95,
                    padding: EdgeInsets.all(10),
                    color: ColorManager.whiteColor,
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomButtonWidget(
                          border: true,
                          title: 'Add to Cart',
                          titleSize: 18,
                          onTap: () {
                            addToCart();
                          },
                          height: 54,
                          width: 168,
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: CustomButtonWidget(
                          border: false,
                          title: 'Buy Now',
                          titleSize: 18,
                          onTap: () {},
                          height: 54,
                          width: 168,
                        )),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    setState(() {
      isLoading=true;
    });
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.getWithToken('ecom/product/'+widget.id.toString(), context);
    var responseJSON = json.decode(response.body);
    setState(() {
      isLoading=false;
    });
    print(responseJSON);
  productData=responseJSON['slug'];
  reviews=responseJSON['review'];
  setState(() {

  });
  }

  addToCart() async {

    var data={
      'product_id':widget.id,
      'hint':'firstcart'
    };
    APIDialog.showAlertDialog(context, 'Adding to cart...');
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.postWithToken('ecom/cart/',data, context);
    var responseJSON = json.decode(response.body);
    Navigator.pop(context);
    print(responseJSON);
    if(responseJSON['message']=='Successfully Add This Cart')
      {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.green);
      }
    else
      {
        Toast.show(responseJSON['message'],
            duration: Toast.lengthLong,
            gravity: Toast.bottom,
            backgroundColor: Colors.red);
      }

  }


}
