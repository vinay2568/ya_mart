import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ya_mart/Screens/Customer/DynamicScreen/dynamic_screen.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/order_placed_success.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/order_screen.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/style_manager.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  late String method ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Payment information',
                      style:
                          getmediumtextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('MORE WAYS TO PAY',style: getmediumtextStyle(fontSize: 13, color: Colors.grey),),

                  SizedBox(
                    height: 20,
                  ),
              GestureDetector(
                onTap:(){
                  setState(() {
                  });
                } ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListTile(
                        title: const Text('Other UPI IDs/Net Banking'),
                        leading: Radio(
                          fillColor: MaterialStateColor.resolveWith((states) => ColorManager.appBtn),
                          focusColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          value: 'Other UPI IDs/Net Banking',
                          groupValue: method,
                          onChanged: (value) {
                  setState(() {
                    method = value.toString();
                  });
                          },
                        ),
                      ),
                ),
              ),

              SizedBox(height: 10,),
              GestureDetector(
                onTap:(){
                  setState(() {
                  });
                } ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListTile(
                        title: const Text('Pay with Debit/Credit/ATM Cards'),
                        leading: Radio(
                          fillColor: MaterialStateColor.resolveWith((states) => ColorManager.appBtn),
                          focusColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          value: 'Pay with Debit/Credit/ATM Cards',
                          groupValue: method,
                          onChanged: (value) {
                  setState(() {
                    method = value.toString();
                  });
                          },
                        ),
                      ),
                ),
              ),

              SizedBox(height: 10,),
              GestureDetector(
                onTap:(){
                  setState(() {
                  });
                } ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListTile(
                        title: const Text('EMI'),
                        leading: Radio(
                          fillColor: MaterialStateColor.resolveWith((states) => ColorManager.appBtn),
                          focusColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          value: 'EMI',
                          groupValue: method,
                          onChanged: (value) {
                  setState(() {
                    method = value.toString();
                  });
                          },
                        ),
                      ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap:(){
                  setState(() {
                  });
                } ,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListTile(
                        title: const Text('Cash on Delivery/Pay on Delivery'),
                        leading: Radio(
                          fillColor: MaterialStateColor.resolveWith((states) => ColorManager.appBtn),
                          focusColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          value: 'Cash on Delivery/Pay on Delivery',
                          groupValue: method,
                          onChanged: (value) {
                  setState(() {
                    method = value.toString();
                  });
                          },
                        ),
                      ),
                ),
              ),


              SizedBox(
                    height: 20,
                  ),
        
              
              RoundButton(
                  title: 'Continue',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderPlacedSuccess()));
                  },
                  loading: false)


                ],
              ),
            )
                      ],
        ),
      ),
    );
  }
}
