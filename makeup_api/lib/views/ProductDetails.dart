// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_api/controllers/prodcutController.dart';

import '../constance.dart';
import 'widgets/CustomButton.dart';
import 'widgets/customtext.dart';
import 'widgets/rounded_shap.dart';

class ProductDetails extends StatelessWidget {
  int index;
  ProductDetails(this.index, {Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (controller) => Scaffold(
              // appBar: appBarFun(),
              backgroundColor:primaryColor,
              body: ListView(
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: Image.network(
                              controller.productList[index].imageLink
                                  .toString(),
                              errorBuilder: (contex, error, starTrack) {
                                return Image.asset(
                                    'assetes/images/photounavailable.png');
                              },
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                              ),
                              if (controller.productList[index].rating != null)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller.productList[index].rating
                                            .toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 32, 31, 31)),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Column(
                          children: [
                            CustomText(
                              controller.productList[index].name.toString(),
                              26,
                              Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 25),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    RoundedShapeInfo(
                                      title: 'Brand : ',
                                      fontSize: 20,
                                      content: CustomText(
                                        controller.productList[index].brand
                                            .toString(),
                                        22,
                                        primaryColor,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RoundedShapeInfo(
                                      title: 'Type :',
                                      fontSize: 20,
                                      content: CustomText(
                                        controller
                                            .productList[index].productType
                                            .toString()
                                            .replaceAll('ProductType.', ''),
                                        15,
                                        primaryColor,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 22),
                            Container(
                              color: Colors.grey.shade200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CustomText('Price', 14, Colors.grey),
                                      CustomText(
                                          controller.productList[index].price
                                              .toString(),
                                          25,
                                          primaryColor)
                                    ],
                                  ),
                                  Container(
                                    width: 145,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      // color: primaryColor
                                    ),
                                    child: Obx(
                                      () => CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          icon: controller.productList[index]
                                                  .isFavorite.value
                                              ? Icon(Icons.favorite_rounded)
                                              : Icon(Icons.favorite_border),
                                          onPressed: () {
                                            controller
                                                .productList[index].isFavorite
                                                .toggle(); 
                                                controller.isFavorite1.value=true; 
                                                
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                  // IconButton(
                                  //   onPressed: () {
                                  //     controller.productList[index].isFavor
                                  //          = true;
                                  //   },
                                  //   icon: controller.productList[index]
                                  //               .isFavor ==
                                  //           false
                                  //       ? Icon(Icons.favorite_border)
                                  //       : Icon(
                                  //           Icons.favorite,
                                  //           color: Colors.red,
                                  //         ),
                                  // ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            CustomText('Details', 30, Colors.black),
                            const SizedBox(height: 20),
                            Stack(
                              children: [
                                CustomText(
                                  controller.productList[index].description
                                      .toString(),
                                  18,
                                  Colors.black54,
                                  hieght: 2.2,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ));
  }

  AppBar appBarFun() {
    return AppBar(
      title: Text('sdd'),
    );
  }
}
