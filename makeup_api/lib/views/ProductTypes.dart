// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable, non_constant_identifier_names
/*
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:makeup_api/controllers/prodcutController.dart';
import 'package:makeup_api/views/HomeContent.dart';

class TypesView extends GetWidget {
  int index;
  TypesView(this.index);
  @override
  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarfun(),
      body: FutureBuilder(
        future:
        controller.x?
        
         controller.fetchData(controller.Types2Namex[index], ''):
         controller.fetchData('', controller.brandList[index]),

        builder: (context, AsyncSnapshot snapshot) {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
/*
                   Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: ListView.separated(
                          itemCount: controller.productTypes.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int index) {
                            return Column(
                              children: [
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color.fromARGB(
                                              255, 139, 116, 116)),
                                      height: 50,
                                      width: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => TypesView(index));
                                          },
                                          child: Image.asset(
                                              controller.CatImges[index]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(controller.productTypes[index].name
                                        .toLowerCase())
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                   */
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return HomeContent(controller.productList[index], index);
                    },
                  ),
                ),
              ],
            );
          }
        },
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

        controller.x?
        controller.Types2Namex[index].toUpperCase():
        
        controller.brandList[index].toUpperCase(),
        style: TextStyle(
            fontFamily: 'avenir', fontSize: 25, fontWeight: FontWeight.w900),
      ),
    );
  }
}
*/