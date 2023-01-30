import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Resources/color_manager.dart';
import 'package:ya_mart/Resources/fonts_manager.dart';
import 'package:ya_mart/Resources/style_manager.dart';
import 'package:ya_mart/Screens/Customer/Home/product_detail_Screen.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/circle_Categories_widget.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/low_price_Store.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/popular_for_you.dart';
import 'package:ya_mart/Screens/Customer/Home/widgets/search_widget.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/cart.dart';
import 'package:ya_mart/network/constants.dart';
import 'package:ya_mart/utils/app_modal.dart';

import '../../../network/api_helper.dart';
import '../../../network/loader.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  List<dynamic> productsList = [];
  List<dynamic> categoryList = [];

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorManager.appBackground,
      drawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(children: [
            Container(
              color: ColorManager.appBackground,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(Images.appLogo),
                      width: 135,
                      height: 135,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) {
                //   return const AboutApp();
                // }));
              },
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: ColorManager.appBtn,
                  ),
                  title: Text('About App'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.rate_review,
                    color: ColorManager.appBtn,
                  ),
                  title: Text('Rate Us'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) {
                //   return const ContactUs();
                // }));
              },
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: ColorManager.appBtn,
                  ),
                  title: Text('Contact Us'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Share.share('check out my website https://example.com');
              },
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.share,
                    color: ColorManager.appBtn,
                  ),
                  title: Text('Share With Friends'),
                ),
              ),
            ),
          ]),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: isLoading
                ? Center(
                    child: Loader(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.grey,
                                  image: const DecorationImage(
                                      image: AssetImage(Iconss.account))),
                            ),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          Text(
                            'User',
                            style: getTextStyle(16, FontweightManager.regular,
                                ColorManager.black),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.favorite_outline)),
                          const SizedBox(
                            width: 11,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen()));
                              },
                              child: const Icon(Icons.shopping_cart_outlined)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                              itemCount: categoryList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int pos) {
                                return Row(
                                  children: [
                                    CategoriesCircle(
                                      img: AppConstant.imageBaseURL +
                                          categoryList[pos]['image'],
                                      txt: categoryList[pos]['name'],
                                      ontap: () {},
                                      height: 80,
                                      width: 80,
                                    ),
                                    SizedBox(width: 10)
                                  ],
                                );
                              })),

                      const SizedBox(
                        height: 20,
                      ),
                      const SearchWidget(),
                      //Low Price Store
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Low Price Store',
                        style: getTextStyle(
                            17, FontweightManager.medium, ColorManager.black),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LowPriceStore(
                              img: Images.facewash,
                              txt: 'Makeup & Care',
                              txt1: 'Under  ₹149',
                              ontap: () {},
                            ),
                            LowPriceStore(
                              img: Images.makeup,
                              txt: 'Home & Kitchen',
                              txt1: 'Under  ₹149',
                              ontap: () {},
                            ),
                            LowPriceStore(
                              img: Images.watch,
                              txt: 'Watches',
                              txt1: 'Under  ₹149',
                              ontap: () {},
                            ),
                          ],
                        ),
                      ),

                      //Popular
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Popular',
                        style: getTextStyle(
                            17, FontweightManager.medium, ColorManager.black),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 180,
                        child: ListView.builder(
                            itemCount: productsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int pos) {
                              return Row(
                                children: [
                                  PopularStore(
                                    img: productsList[pos]['image_1'] == null
                                        ? ''
                                        : AppConstant.imageBaseURL +
                                            productsList[pos]['image_1'],
                                    txt: productsList[pos]['title'],
                                    txt1: '₹' +
                                        productsList[pos]['discount_price']
                                            .toString(),
                                    ontap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailScreen(
                                                      productsList[pos]
                                                          ['id'])));
                                    },
                                  ),
                                  SizedBox(width: 10)
                                ],
                              );
                            }),
                      ),

                      SizedBox(height: 15),

                      Text(
                        'Popular For You',
                        style: getTextStyle(
                            17, FontweightManager.medium, ColorManager.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      RowWidgetPopular(
                        img1: Images.blueShirt,
                        img2: Images.kidWear,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RowWidgetPopular(
                        img1: Images.menShoes,
                        img2: Images.earBuds,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  fetchProfile(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.getWithToken('auth/profile', context);
    var responseJSON = json.decode(response.body);
    setState(() {
      isLoading = false;
    });
    AppModel.setUserIdValue(responseJSON['id'].toString());
    AppModel.setFullName(responseJSON['full_name'] ?? '');
    print(responseJSON);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProfile(context);
    fetchProducts(context);
    fetchCategories(context);
  }

  fetchProducts(BuildContext context) async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.getWithToken('ecom/product', context);
    var responseJSON = json.decode(response.body);
    print(responseJSON);
    productsList = responseJSON;
    setState(() {});
  }

  fetchCategories(BuildContext context) async {
    ApiBaseHelper helper = ApiBaseHelper();
    var response = await helper.getWithToken('ecom/category/', context);
    var responseJSON = json.decode(response.body);
    categoryList = responseJSON;
    print(responseJSON);
  }
}

class RowWidgetPopular extends StatelessWidget {
  String img1;
  String img2;

  RowWidgetPopular({Key? key, required this.img1, required this.img2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PopularForYouWidget(
            img: img1,
            title: 'Flannel Men Shirts',
            price: '350',
            rating: '3.9',
            reviews: '11,211',
            itemTap: () {},
            favTap: () {},
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: PopularForYouWidget(
            img: img2,
            title: 'Baby Snowsuit ',
            price: '299',
            rating: '3.7',
            reviews: '3,403',
            itemTap: () {},
            favTap: () {},
          ),
        ),
      ],
    );
  }
}
