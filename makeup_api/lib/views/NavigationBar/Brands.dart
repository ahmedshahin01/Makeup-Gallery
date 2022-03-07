// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:makeup_api/constance.dart';
import 'package:makeup_api/views/NavigationBar/HomeView.dart';

import '../../controllers/prodcutController.dart';
import '../widgets/customtext.dart';
import '../widgets1/Custom_clippers.dart';
import '../widgets1/clip_shadow_paht.dart';

class BrandsView extends GetWidget {
  @override
  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
//appBar: AppBarfun(),
      body: Stack(
        children: [
          
          ClipShadowPath(
            clipper: BigClipper(),
            shadow: BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 8),
            child: Container(color: primaryColor.shade200),
          ),
          ClipShadowPath(
            shadow: BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                offset: Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 8),
            clipper: SmallClipper(),
            child: Container(color:primaryColor),
          ),

          Column(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 210,
                  width: double.infinity,
                  child: Image.asset(
                    'assetes/images/brand.png',
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: controller.brandList.length,
                itemBuilder: (context, index) {
                  return BrandCardFun(index);
                },
              ))
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector BrandCardFun(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => HomeView(index));
      },
      child: Opacity(
        opacity: .7,
        child: Card(
          shadowColor: Colors.black,
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomText(controller.brandList[index], 20, Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                CustomText(controller.brandList[index].length.toString(), 25,
                    Color.fromARGB(255, 19, 42, 53)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar AppBarfun() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.red,
          Colors.deepOrange,
          Color.fromARGB(255, 210, 64, 255)
        ])),
      ),
      title: Text(
        'ShopX',
        style: TextStyle(
            fontFamily: 'avenir', fontSize: 32, fontWeight: FontWeight.w900),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {},
            ),
            IconButton(icon: Icon(Icons.view_list_rounded), onPressed: () {}),
            IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
