// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:makeup_api/controllers/AuthController.dart'; 
import 'package:makeup_api/controllers/prodcutController.dart';

class Binding1 extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
   // Get.lazyPut(() => NavigationController());
   Get.lazyPut(() => AuthController());
  }

}