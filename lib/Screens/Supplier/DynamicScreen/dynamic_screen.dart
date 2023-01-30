import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';
import 'package:ya_mart/Resources/assets_manager.dart';
import 'package:ya_mart/Screens/Supplier/SupplierDashboard/supplier_inventory.dart';

import '../../../Resources/color_manager.dart';
import '../SupplierDashboard/supplier_home.dart';
import '../SupplierDashboard/supplier_orders.dart';
import '../supplier_menu.dart';

class SupplierDynamicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavLayout(
      pages: [
        (_) => const SupplierOrderScreen(),
        (_) => const SupplierHomeScreen(),
        (_) => const SupplierInventoryScreen(),
        (_) => const SupplierMenuScreen(),
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
                AssetImage(Iconss.supOrders),
              ),
              label: 'Orders'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Iconss.supHome),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Iconss.supInventory),
              ),
              label: 'Inventory'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Iconss.supMenu),
              ),
              label: 'Menu'),
              
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
