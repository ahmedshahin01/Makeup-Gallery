// ignore_for_file: avoid_print, unused_local_variable, file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, implementation_imports


import 'package:flutter/src/material/colors.dart';
import 'package:get/get.dart';
import 'package:makeup_api/constance.dart';
import 'package:makeup_api/models/productModel.dart';

import '../services/remote_services.dart';

class ProductController extends GetxController {
  RxInt currentIndex = 1.obs;
  var productList = <Product>[].obs;
  var ProductColorsL = <ProductColor>[].obs;
  //bool x = true;
  RxInt selector = 1.obs;
  var type;
  var Types2Namex = [
    'lip_liner',
    'lipstick',
    'foundation',
    'eyeliner',
    'eyeshadow',
    'blush',
    'bronzer',
    'mascara',
    'eyebrow',
    'nail_polish'
  ].obs;

  RxBool isLoading = true.obs;
  List CatImges = [
    'assetes/images/lip_liner.png',
    'assetes/images/lipstick.png',
    'assetes/images/foundation.png',
    'assetes/images/eyeliner.png',
    'assetes/images/eyeshadow.png',
    'assetes/images/blush.png',
    'assetes/images/bronzer.png',
    'assetes/images/mascara.png',
    'assetes/images/eyebrow.png',
    'assetes/images/nail_polish.png',
  ];
  var brandList = [
    'almay',
    'alva',
    'anna sui',
    'annabelle',
    'benefit',
    'boosh',
    'burt\'s bees',
    'butter london',
    'c\'est moi',
    'cargo cosmetics',
    'china glaze',
    'clinique',
    'colourpop',
    'covergirl',
    'dalish',
    'tenth',
    'dior',
    'dr. haschka',
    'elf',
    'essie',
    'fenty',
    'glossier',
    'green people',
    'iman',
    'l\'oreal',
    'maia\'s mineral galaxy',
    'marcelle',
    'marienatie',
    'maybelline',
    'milani',
    'mineral fusion',
    'misa',
    'mistura',
    'moov',
    'naked',
    'nyx',
    'orly',
    'peacemaking',
    'penny wool organics',
    'physicians formula',
    'piggy paint',
    'pure anada',
    'help the minerals',
    'revlon',
    'sally b\'s skin yummies',
    'salon perfect',
    'sante',
    'sinful colors',
    'smashbox',
    'sila',
    'suncoat',
    'w3llpeople',
    'wet n wild',
    'zorah',
    'zorah biocosmetiques',
  ];
  fetchData(type, brand) async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts(type, brand);

      productList.value = products!;

      print("hsakhfklsah");
      print(selector);
    } finally {
      isLoading(false);
    }
  }

  //////
  ///
  RxBool isFavorite1 = false.obs;
  getFavrit(product1, isFavorite1) async {
    FavproductList.value = product1;
  }

  var FavproductList = <Product>[].obs;

  ///

  Rx<MaterialColor> currentCollor = primaryColor.obs;
  void changColor(color) {
    currentCollor.value = color;

    primaryColor = currentCollor.value;
  }

  ///

  /*fetchDataByType(String type) async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProductsByTypes(type);

    //  var productsTypes1 = await RemoteServices.fetchProductTypes();
     // var productColors = await RemoteServices.fetchProductColors();

      productList.value = products!;
    //  ProductColorsL.value = productColors!;
        //    productTypes.value=productsTypes1!;

    
      print("hsakhfklsah");
  
    } finally {
      isLoading(false);
    }
  }*/

}
