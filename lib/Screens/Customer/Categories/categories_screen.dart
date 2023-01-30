import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ya_mart/network/constants.dart';

import '../../../Resources/assets_manager.dart';
import '../../../Resources/color_manager.dart';
import '../../../Resources/fonts_manager.dart';
import '../../../Resources/style_manager.dart';
import '../../../network/api_helper.dart';
import '../../Supplier/CompleteAccountDetails/gst_verify_Screen.dart';
import '../Home/widgets/circle_Categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isLoading=false;
  List<dynamic> categoryList=[];
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
                
                
               
                
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CATEGORIES',
                        style: getTextStyle(
                            16, FontweightManager.regular, ColorManager.black),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {}, child: const Icon(Icons.search)),
                      const SizedBox(
                        width: 11,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.favorite_outline)),
                      const SizedBox(
                        width: 11,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.shopping_cart_outlined)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int pos)
                      {
                        return   Row(
                          children: [
                            CategoriesCircle(
                              img:AppConstant.imageBaseURL+categoryList[pos]['image'],
                              txt:categoryList[pos]['name'],
                              ontap: () {},
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(width: 10)
                          ],
                        );
                      }

                  )
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  children: const [
                    CategoriesTab(),
                    SelectCategory(),
                  ],
                )
              ]),
        ),
      ),
    );
  }
  fetchCategories(BuildContext context) async {
    setState(() {
      isLoading=true;
    });
    ApiBaseHelper helper = ApiBaseHelper();
    var response =
    await helper.getWithToken('ecom/category/', context);
    var responseJSON = json.decode(response.body);
    setState(() {
      isLoading=false;
    });
    categoryList=responseJSON;
    print(responseJSON);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategories(context);
  }


}

class SelectCategory extends StatefulWidget {
   const SelectCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
    final List<ImageIcon> iconList = [
    ImageIcon(AssetImage('assets/icons/1st.png')),
    ImageIcon(AssetImage('assets/icons/1st.png')),
    ImageIcon(AssetImage('assets/icons/1st.png')),
    ImageIcon(AssetImage('assets/icons/1st.png')),
    
    ImageIcon(AssetImage('assets/icons/1st.png')),
  ];

  final List imgList = [
    'assets/icons/box.png',
    'assets/icons/women.png',
    'assets/icons/men.png',
    'assets/icons/bhaloo.png',
    'assets/icons/jewllery.png',
  ];

  final List<String> titleList = [
    "Popular",
    "Women\nEthnic",
    "Men",
    "Kids",
    "Jewllery",
  ];

  int _currentIndex = 0;

  bool chkValue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 110,
        height: 505,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            
             border: Border.all(),
             
             ),
        child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(iconList.length, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 100,
                              width: 94,
                              
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                    AssetImage(imgList[index]),
                                    color: _currentIndex == index
                                        ? Colors.black
                                        : Color(0xFF4c4e4f),
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    titleList[index],
                                    textAlign: TextAlign.center,
                                    style: getregulartextStyle(
                                      fontSize: 16,
                                      color: _currentIndex == index
                                          ? Colors.black
                                          : Color(0xFF4c4e4f),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Container(
                  height: 500,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(iconList.length, (index) {
                      return Container(
                        height: 100,
                        width: 10,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? ColorManager.darkGrey
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),
                ),
                  ],
                ),
      ),
    );
  }
}




class CategoriesTab extends StatelessWidget {
  const CategoriesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                        
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                        CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                        CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                   
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                        
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    CategoriesCircle(
                        img: Images.women1,
                        txt: 'Kurti',
                        height: 58,
                        width: 58,
                        ontap: () {}),
                    
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class CategoriesName extends StatelessWidget {
  String title;
  String icon;
  VoidCallback onTap;
  CategoriesName(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ImageIcon(AssetImage(icon)),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
