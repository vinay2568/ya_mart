import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Widgets/roundButton.dart';

import 'order_screen.dart';
import 'Widgets/container_widget.dart';
import 'Widgets/drop_down.dart';

class CancelOrders extends StatefulWidget {
  const CancelOrders({Key? key}) : super(key: key);

  @override
  State<CancelOrders> createState() => _CancelOrdersState();
}

class _CancelOrdersState extends State<CancelOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorManager.appBackground,

      body: SafeArea(
        child: Column(
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
                                        builder: (context) => OrdersScreen()));
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

            SizedBox(height: 15,),

            Container(
              height: MediaQuery.of(context).size.height*0.21,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(

                  children: [

                    Row(
                      children: [

                        Text("Cancel Order",style: getregulartextStyle(color: Colors.black,fontSize: 16),),

                      ],
                    ),

                    SizedBox(height: 10,),

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
                                blurRadius:4,
                                offset: Offset(0,5), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              image: AssetImage(Images.brownShirt),
                              fit:BoxFit.cover
                            ),
                          ),
                        ),

                        SizedBox(width: 20,),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Flanel Men Cotton",style: getmediumtextStyle(color: Colors.black,fontSize: 16),),
        
                                Row(
        
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
        
                                    Text("Check Shirt (Red)",style: getmediumtextStyle(color: Colors.black,fontSize: 16),),
        
                                    Text("\$350,00",style: getregulartextStyle(color: Colors.black,fontSize: 16),),
        
                                  ],
                                ),
        
                                SizedBox(height: 20,),
        
                                Text("Qty: 1",style: getregulartextStyle(color: Colors.green,fontSize: 14),),
        
                                Text("Sold By: Hassan Collection",style: getregulartextStyle(color: Colors.green,fontSize: 14),),
                          ],),
                        ),

                      ],
                    )

                  ],
                ),
              ),
            ),

            SizedBox(height: 25,),

            DropDown(text: "Cancel Reasons"),

            SizedBox(height: 25,),

            ContainerWidget(text: 'Order Place by Mistake',),

            SizedBox(height: 15,),

            ContainerWidget(text: 'Need to change shipping Address',),

            SizedBox(height: 15,),

            ContainerWidget(text: 'Poor Product',),

            SizedBox(height: 15,),

            ContainerWidget(text: 'Product Price To High',),

            SizedBox(height: 15,),

            ContainerWidget(text: 'Need to change Payment Method',),

            SizedBox(height: 25,),
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RoundButton(title: "Cancel", onTap: (){}, loading: false),
            )



            

          ],
        ),
      ),

    );
  }
}




