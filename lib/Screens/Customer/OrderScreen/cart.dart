import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/network/loader.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../network/api_dialog.dart';
import '../../../network/api_helper.dart';
import 'delivery_address.dart';

class CartScreen extends StatefulWidget {
  CartState createState() => CartState();
}

class CartState extends State<CartScreen> {
  List<dynamic> productList = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFfF1F2F5),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: Loader(),
            )
          : productList.length == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/empty.png',
                        width: 130, height: 130),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        'Your cart is empty !',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(height: 26),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryAddress()));
                      },
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFF83B00),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            'Proceed to Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Expanded(
                        child: ListView.builder(
                            itemCount: productList.length,
                            itemBuilder: (BuildContext context, int pos) {
                              return Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 0,
                                                    blurRadius: 4,
                                                    offset: Offset(0,
                                                        5), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        Images.brownShirt),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: Color(0xFFF83B00),
                                                      width: 0.4)),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      updateCartItem(
                                                          'dec',
                                                          productList[pos]
                                                              ['product']);
                                                    },
                                                    child: Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFF83B00),
                                                              width: 0.2)),
                                                      child: Center(
                                                        child: Text("-",
                                                            style:
                                                                getboldtextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        22)),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Text(
                                                      productList[pos]
                                                              ['quantity']
                                                          .toString(),
                                                      style:
                                                          getsemiboldtextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18)),
                                                  SizedBox(width: 15),
                                                  InkWell(
                                                    onTap: () {
                                                      updateCartItem(
                                                          'inc',
                                                          productList[pos]
                                                              ['product']);
                                                    },
                                                    child: Container(
                                                      width: 35,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFF83B00),
                                                              width: 0.2)),
                                                      child: Center(
                                                        child: Text("+",
                                                            style:
                                                                getboldtextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        22)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    productList[pos]
                                                        ['product_title'],
                                                    style: getmediumtextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                  Spacer(),
                                                  GestureDetector(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(7),
                                                      child: Icon(Icons.delete,
                                                          color: ColorManager
                                                              .appBtn),
                                                    ),
                                                    onTap: () {
                                                      productDeleteDialog(
                                                          context,
                                                          productList[pos]
                                                              ['product']);
                                                    },
                                                  )
                                                ],
                                              ),
                                              /*  Text(
                                      "Check Shirt (Red)",
                                      style: getmediumtextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),*/
                                              SizedBox(height: 10),
                                              Text(
                                                productList[pos]['price'] ==
                                                        null
                                                    ? 'NA'
                                                    : '₹ ' +
                                                        productList[pos]
                                                                ['price']
                                                            .toString(),
                                                style: getregulartextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                "Eligible for free shipping",
                                                style: getregulartextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                "In stock",
                                                style: getregulartextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            }))
                  ],
                ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMyCart(context, true);
  }

  productDeleteDialog(BuildContext context, int productId) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Remove",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        Navigator.pop(context);
        removeCartItem(productId);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Remove Product?"),
      content: Text("Are you sure you want to remove this product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  fetchMyCart(BuildContext context, bool showLoader) async {
    if (showLoader) {
      setState(() {
        isLoading = true;
      });
    }
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.getWithToken('ecom/cart', context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    if (showLoader) {
      isLoading = false;
    }
    productList = responseJSON['data'];
    setState(() {});
  }

  updateCartItem(String type, int productId) async {
    var data = {
      'product_id': productId,
      'hint': type == 'inc' ? 'increment-cart' : 'decrement-cart'
    };
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.postWithToken('ecom/cart/', data, context);
    var responseJSON = json.decode(response.body);
    Navigator.pop(context);
    print(responseJSON);
    fetchMyCart(context, false);
  }

  removeCartItem(int productId) async {
    var data = {'product_id': productId, 'hint': 'remove'};
    APIDialog.showAlertDialog(context, 'Please wait...');
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.postWithToken('ecom/cart/', data, context);
    var responseJSON = json.decode(response.body);
    Navigator.pop(context);
    print(responseJSON);
    fetchMyCart(context, false);
  }
}
