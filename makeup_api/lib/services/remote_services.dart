

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:http/http.dart' as http;
import 'package:makeup_api/models/productModel.dart';

class RemoteServices {
  
  static Future<List<Product>?> fetchProducts(type,brand) async {
    final url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?price_greater_than=1&product_type=${type}&brand=${brand}');
    await http.get(url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jstonData = response.body;

      return productFromJson(jstonData);
    } else {
      return null;
    }
  }

  /*static Future<List<ProductType>?> fetchProductTypes( ) async {
    final url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?price_greater_than=1');
    await http.get(url);
    http.Response response = await http.get(url);
  

    if (response.statusCode == 200) {
      return ProductType.values;
    } else {
      return null;
    }
  }*/

  ////
/*static Future<List<ProductColor>?> fetchProductColors() async {
    final url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?price_greater_than=1');
    await http.get(url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jstonData = response.body;

      return productColorFromJson(jstonData);
    } else {
      return null;
    }
  }*/

/*static Future<List<Product>?> fetchProductsByTypes(String type) async {
    final url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?price_greater_than=1&product_type=${type}');
    await http.get(url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jstonData = response.body;

      return productFromJson(jstonData);
    } else {
      return null;
    }
  }*/
  

  
}
/*
class RoleService with ChangeNotifier {
  NavLinks _navLinks = NavLinks();
  late List<Role> _roles;



  /// Get all Roles
  Future<void> getAllRoles(String authToken) async {
    try {
      var data = await http.get(
        Uri.parse("https://api2.example.com/userrel/roles/getall"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"},
      );
      var jsonData =
          convert.json.decode(data.body).cast<Map<String, dynamic>>();
      _roles = jsonData.map<Role>((json) => new Role.fromJson(json)).toList();
      print(_roles);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}






import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:network_test/role.dart';
import 'dart:convert' as convert;
import 'dart:io';

class RoleService with ChangeNotifier {
  late List<Role> _roles;
  String link2 = "https://api2.somewhere.com/userrel";

  /// Return roles
  List<Role> returnRoles() {
    return _roles;
  }

  /// Get all Roles
  Future<void> getAllRoles(String authToken, Client client) async {
    try {
      var data = await client.get(Uri.parse(link2 + "/role/getall"),
          headers: {HttpHeaders.authorizationHeader: "Bearer $authToken"});

     
      var jsonData =
          convert.json.decode(data.body).cast<Map<String, dynamic>>();
      _roles = jsonData.map<Role>((json) => Role.fromJson(json)).toList();
      print(_roles[0].roleName);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
 */