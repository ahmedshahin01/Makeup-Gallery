// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, file_names, non_constant_identifier_names

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_api/constance.dart';
import 'package:makeup_api/controllers/prodcutController.dart';
import 'package:makeup_api/views/authScreens/Login.dart';

import '../controllers/AuthController.dart';
import 'NavigationBar/Brands.dart';
import 'NavigationBar/Category.dart';
import 'NavigationBar/HomeView.dart';

class ControllView extends GetWidget<AuthController> {
  List<Widget> screens = [
    // ProfileView(),
    CategoryView(),
    HomeView(1),
    BrandsView(),
    //FavoritView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthController>().user == null
          ? LogInScrreen()
          : GetBuilder<ProductController>(
              builder: (controller) => Scaffold(
                body: GetX<ProductController>(
                    builder: (controller) =>
                        screens[controller.currentIndex.value]),
                bottomNavigationBar: BottomNavigationFun(controller),
              ),
            );
    });
  }

  GetBuilder<ProductController> BottomNavigationFun(
      ProductController controller) {
    return GetBuilder<ProductController>(
      builder: (conttroller1) => ConvexAppBar(
        style: TabStyle.titled,
        backgroundColor: Color.fromARGB(255, 73, 71, 71),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          //TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.category_outlined, title: 'Category'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.calendar_today, title: 'Brands'),
          //TabItem(icon: Icons.favorite_border, title: 'Favorite')
        ],

        activeColor: primaryColor,

        initialActiveIndex: conttroller1.currentIndex.value,
        onTap: (index) {
          conttroller1.currentIndex.value = index;
          //controller.x = index==0 ? true : false;
          controller.selector.value = index;
        },
      ),
    );
  }
}
