import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ya_mart/Resources/fonts_manager.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/product_detail_title.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/cancel_items.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/delivery_address.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/payment_methods.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/return_product.dart';
import 'package:ya_mart/Widgets/Custom_button_border.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/style_manager.dart';
import '../Home/widgets/search_widget.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({super.key});
  int counter = 0;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DynamicScreen()));
                              },
                              child: Icon(
                                CupertinoIcons.back,
                                color: Colors.grey,
                              ))),
                      SizedBox(
                        width: 22,
                      ),
                      OrderScreenSearch(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ProductDetailPageTitle(title: 'View order details'),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                height: 99,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Order date',
                            style: getregulartextStyle(
                                fontSize: 17, color: Colors.grey),
                          ),
                          Text(
                            'Order #',
                            style: getregulartextStyle(
                                fontSize: 17, color: Colors.grey),
                          ),
                          Text(
                            'Order total',
                            style: getregulartextStyle(
                                fontSize: 17, color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '25-Dec-2022',
                            style: getregulartextStyle(
                                fontSize: 17, color: Colors.black),
                          ),
                          Text(
                            '408-3520278-0095552',
                            style: getregulartextStyle(
                                fontSize: 17, color: Colors.black),
                          ),
                          Row(
                            children: [
                              Text(
                                '₹ 350.00 ',
                                style: getregulartextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              Text(
                                '(1 item)',
                                style: getregulartextStyle(
                                    fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CancelOrders()));},
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cancel items',
                            style: getregulartextStyle(
                                fontSize: 17, color: Colors.black),
                          ),
                          Spacer(),
                          Icon(CupertinoIcons.forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ProductDetailPageTitle(title: 'Shipment details'),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                height: 305,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Standard Delivery',
                      style:
                          getmediumtextStyle(fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Not yet dispatched',
                      style:
                          getmediumtextStyle(fontSize: 17, color: Colors.black),
                    ),
                    Text(
                      'Estimate delivery:',
                      style:
                          getregulartextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      'Wednesday, 28 December, 2022',
                      style: getregulartextStyle(
                          fontSize: 15, color: ColorManager.midGreen),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 65,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Images.blueShirt),
                                  fit: BoxFit.cover),
                              color: ColorManager.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flannel men cotton\ncheck shirt (Red)',
                              style: getmediumtextStyle(
                                  fontSize: 17, color: Colors.black),
                            ),
                            Text(
                              'Qty: 1',
                              style: getregulartextStyle(
                                  fontSize: 15, color: ColorManager.midGreen),
                            ),
                            Text(
                              'Sold By: Krishna Collection',
                              style: getregulartextStyle(
                                  fontSize: 15, color: ColorManager.midGreen),
                            ),
                          ],
                        ),
                        Text(
                          '₹ 350.00 ',
                          style: getmediumtextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ProductDetailPageTitle(title: 'Payment information'),
              ),
              SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethods()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Method',
                        style: getmediumtextStyle(
                            fontSize: 17, color: Colors.black),
                      ),
                      Text(
                        'BHIM UPI',
                        style: getregulartextStyle(
                            fontSize: 17, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 161,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Billing Address',
                      style:
                          getmediumtextStyle(fontSize: 17, color: Colors.black),
                    ),
                    Text(
                      '8/41 Chitrakoot\nNear SBI Bank Vashali Nagar,\nJaipur\nRajasthan\n302021',
                      style:
                          getregulartextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeliveryAddress()));},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping Address',
                        style:
                            getmediumtextStyle(fontSize: 17, color: Colors.black),
                      ),
                      Text(
                        'Pawan Kumar\n8/41 Chitrakoot\nNear SBI Bank Vashali Nagar,\nJaipur\nRajasthan 302021\nIndia',
                        style:
                            getregulartextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Items:',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          'Postage & Packing:',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          'Total before Tax:',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          'Tax:',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          'Total:',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₹ 350.00',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          '₹ 0.00',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          '₹ 0.00',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          '₹ 0.00',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          '₹ 350.00',
                          style: getregulartextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: RoundButton(
                    title: 'Proceed to Buy', onTap: () {}, loading: false),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 85,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  image: DecorationImage(
                                      image: AssetImage(Images.redShirt),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 40,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(0,
                                              5), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.3))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => setState(() {
                                          widget.counter == 0
                                              ? print('counter at 0')
                                              : widget.counter--;
                                        }),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                      Text('${widget.counter}'),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            print('set');
                                            widget.counter++;
                                          });
                                        },
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.3)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Icon(Icons.add)),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Flanel Men Cotton",
                                  style: getmediumtextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                Text(
                                  "Check Shirt (Red)",
                                  style: getmediumtextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "\$350,00",
                                  style: getregulartextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Eligible for free shopping",
                                  style: getregulartextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "In Stock",
                                  style: getregulartextStyle(
                                      color: Colors.green, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButtonWidget(
                              title: 'Delete',
                              onTap: () {},
                              border: true,
                              height: 33,
                              width: 145,
                              titleSize: 16),
                          CustomButtonWidget(
                              title: 'Buy',
                              onTap: () {},
                              border: true,
                              height: 33,
                              width: 145,
                              titleSize: 16),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 315,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "item Delivered",
                            style: getmediumtextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Item Delivered:',style: getregulartextStyle(
                            color: Colors.grey, fontSize: 15),),
                      Text(
                        "Wednesday, 28 December, 2022",
                        style: getregulartextStyle(
                            color: Colors.green, fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 5), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(
                                  image: AssetImage(Images.redShirt),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Flanel Men Cotton",
                                  style: getmediumtextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Check Shirt (Red)",
                                      style: getmediumtextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      "\$350,00",
                                      style: getregulartextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Qty: 1",
                                  style: getregulartextStyle(
                                      color: Colors.green, fontSize: 15),
                                ),
                                Text(
                                  "Sold By: Hassan Collection",
                                  style: getregulartextStyle(
                                      color: Colors.green, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReturnProduct()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Return Product",
                              style: getmediumtextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderScreenSearch extends StatelessWidget {
  const OrderScreenSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 9,
        child: Form(
            child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffF8F9FA),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white)),
            hintText: 'Search Product',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            prefixIcon:
                Icon(Icons.search, color: Color.fromARGB(255, 114, 112, 112)),
            suffixIconConstraints: BoxConstraints(maxWidth: 75),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ImageIcon(
                    AssetImage(Iconss.mic),
                    size: 20,
                    color: ColorManager.black,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: ColorManager.whiteColor)),
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        )));
  }
}
