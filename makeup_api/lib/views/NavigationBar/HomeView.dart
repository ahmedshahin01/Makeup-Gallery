// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, sized_box_for_whitespace, unused_import

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:makeup_api/constance.dart';
import 'package:makeup_api/controllers/prodcutController.dart';
import 'package:makeup_api/models/productModel.dart';
import 'package:makeup_api/views/HomeContent.dart';
import 'package:makeup_api/views/ProductTypes.dart';
import 'package:makeup_api/views/controllView.dart';
import 'package:makeup_api/views/widgets/Drower.dart';
import 'package:makeup_api/views/widgets/customtext.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../authScreens/Login.dart';
import '../widgets1/Custom_clippers.dart';
import '../widgets1/clip_shadow_paht.dart';

class HomeView extends GetWidget<ProductController> {
  int index;
  HomeView(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBarfun(),
//drawer: MyDrower(),
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
              child: Container(color: primaryColor),
            ),
            FutureBuilder(
              future: controller.selector.value == 1
                  ? controller.fetchData('', '')
                  : controller.selector.value == 0
                      ? controller.fetchData(controller.Types2Namex[index], '')
                      : controller.fetchData('', controller.brandList[index]),

              //controller.fetchData('',''),
              builder: (context, AsyncSnapshot snapshot) {
                if (controller.isLoading.value) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      CustomText(
                        'Wait Laoding Data From Internet',
                        25,
                        Colors.greenAccent,
                        alignment: Alignment.center,
                      ),
                      Expanded(
                        child:
                            LottieBuilder.asset('assetes/images/makeup.json'),
                      ),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: MasonryGridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            itemCount: controller.productList.length,
                            itemBuilder: (context, index) {
                              return HomeContent(
                                controller.productList[index],
                                index,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        )

        // bottomNavigationBar:BottomFun(),
        );
  }

  AppBar AppBarfun() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          primaryColor,
          primaryColor.shade300,
          primaryColor.shade200
        ])),
      ),
      title: Text(
        controller.selector.value == 1
            ? 'MakeUp Gallery'
            : controller.selector.value == 0
                ? controller.Types2Namex[index].toUpperCase()
                : controller.brandList[index].toUpperCase(),
        style: TextStyle(
            fontFamily: 'avenir', fontSize: 32, fontWeight: FontWeight.w900),
      ),
      actions: [
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.color_lens_outlined),
                onPressed: () {
                  ColorPicFun();
                }),
            SizedBox(width: 5),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Get.offAll(() => LogInScrreen());
                }),
            SizedBox(
              width: 8,
            )
          ],
        ),
      ],
    );
  }

  Future<dynamic> ColorPicFun() {
    return Get.defaultDialog(
        title: 'color Select',
        content: Column(
          children: [
            Divider(
              color: Colors.green,
            ),
            SingleChildScrollView(
              child: BlockPicker(
                pickerColor: controller.currentCollor.value,
                onColorChanged: (color) {
                  controller.changColor(color);
                  primaryColor = color as MaterialColor;
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  controller.changColor(controller.currentCollor.value);

                  Get.offAll(() => ControllView());
                },
                child: CustomText(
                  'select',
                  20,
                  Colors.black,
                  alignment: Alignment.center,
                ))
          ],
        ));
  }

  Stack ClipperBack() {
    return Stack(
      children: [
        ClipShadowPath(
          clipper: BigClipper(),
          shadow: BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 8),
          child: Container(color: Colors.orangeAccent),
        ),
        ClipShadowPath(
          shadow: BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 8),
          clipper: SmallClipper(),
          child: Container(color: Color.fromARGB(255, 206, 79, 70)),
        ),
      ],
    );
  }
}
