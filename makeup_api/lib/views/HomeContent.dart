// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_api/constance.dart';
import 'package:makeup_api/models/productModel.dart';

import 'ProductDetails.dart';

class HomeContent extends StatelessWidget {
  final Product product;
  HomeContent(this.product, this.index);
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: .8,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetails(index));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child:
                              //Image.asset('assetes/images/photounavailable.png'),
                              Image.network(
                            product.imageLink.toString(),
                            errorBuilder: (contex, error, starTrack) {
                              return Image.asset(
                                  'assetes/images/photounavailable.png');
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.name.toString(),
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: 'avenir', fontWeight: FontWeight.w800),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    if (product.rating != null)
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
                              product.rating.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 31, 31)),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price}',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'avenir',
                                color: primaryColor)),
                        Obx(
                          () => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: product.isFavorite.value
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                product.isFavorite.toggle();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
        /* Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink.toString(),
                    fit: BoxFit.cover,
                    errorBuilder: (contex , error,starTrack){return Image.asset('assetes/images/splash.jpg');},
                  ),
                ),
               
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name.toString(),
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
              
            ),
          ],
        ),
      ),
    )*/
        /* Card(
              elevation: 10,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(product.imageLink.toString()),
                      ),
                      Text(product.description.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text(product.name.toString()),
                      Text(product.brand.toString()),
                      Text(product.category.toString()),
                      Text(product.price.toString()),
                    ],
                  ),
                ],
              ),
            )*/
  
