import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Screens/Customer/Account/acount_screen.dart';
import 'package:ya_mart/Screens/Customer/Categories/categories_screen.dart';
import 'package:ya_mart/Screens/Customer/Home/home_screen.dart';
import 'package:ya_mart/Screens/Customer/OrderScreen/order_screen.dart';

import '../../../Resources/color_manager.dart';

class DynamicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavLayout(
      pages: [
        (_) => const CategoriesScreen(),
        (_) =>  OrdersScreen(),
        (_) => const CustomerHomeScreen(),
        (_) => const MyAccountScreen(),
      ],
      bottomNavigationBar: (currentIndex, onTap) => BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: ColorManager.appBtn),
        unselectedItemColor: ColorManager.black,
        selectedItemColor: ColorManager.appBtn,
        //  fixedColor: ColorManager.primary,
        selectedIconTheme: IconThemeData(color: ColorManager.appBtn),
        unselectedIconTheme: IconThemeData(color: ColorManager.black),
        unselectedLabelStyle: TextStyle(
          color: ColorManager.black,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) => onTap(index),
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Iconss.category),
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Iconss.bag),
              ),
              label: 'Orders'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Iconss.home),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Iconss.person),
              ),
              label: 'Account'),
              
        ],
      ),
      savePageState: false,
      lazyLoadPages: false,
      // StandardPageStack, ReorderToFrontExceptFirstPageStack, NoPageStack, FirstAndLastPageStack
      pageStack: ReorderToFrontPageStack(initialPage: 0),
      extendBody: false,
      resizeToAvoidBottomInset: true,
      pageTransitionData: null,
    );
  }
}
