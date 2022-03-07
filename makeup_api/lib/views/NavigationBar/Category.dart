// ignore_for_file: must_be_immutable, annotate_overrides, prefer_const_constructors, use_key_in_widget_constructors, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart'; 
import 'package:makeup_api/views/NavigationBar/HomeView.dart';
import 'package:makeup_api/views/widgets/customtext.dart';

import '../../constance.dart';
import '../../controllers/prodcutController.dart';
 
import '../widgets1/Custom_clippers.dart';
import '../widgets1/clip_shadow_paht.dart';

class CategoryView extends GetWidget {
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
                  color: Colors.grey,
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: 8),
              child: Container(color:primaryColor.shade200),
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
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Image.asset(
                    'assetes/images/cover.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: AlignedGridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: controller.CatImges.length,
                    itemBuilder: (context, index) {
                      return CatContentFun(
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Opacity CatContentFun({index}) {
    return Opacity(
      opacity: .7,
      child: Card(
        child: GestureDetector(
          onTap: () {
            Get.to(() => HomeView(index));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  Color.fromARGB(255, 230, 131, 124),
                  Color.fromARGB(255, 110, 88, 81),
                  Color.fromARGB(255, 58, 36, 65)
                ],
              ),
            ),
            width: 150,
            height: 120,
            child: Column(
              children: [
                SizedBox(
                    height: 80, child: Image.asset(controller.CatImges[index])),
                CustomText(
                  controller.Types2Namex[index],
                  25,
                  Colors.black,
                  alignment: Alignment.center,
                  fontWeight: FontWeight.bold,
                )
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
            // ignore: prefer_const_literals_to_create_immutables
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
