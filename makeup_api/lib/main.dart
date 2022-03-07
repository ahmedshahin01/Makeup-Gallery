// ignore_for_file: prefer_const_constructors, unused_import   
// 4juqxR+bfCEhOEDslBTwAePpz74=

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_api/helper/Binding.dart';
import 'package:makeup_api/views/NavigationBar/Category.dart';
import 'package:makeup_api/views/NavigationBar/HomeView.dart';
import 'package:makeup_api/views/authScreens/Login.dart';
import 'package:makeup_api/views/controllView.dart';

import 'views/widgets1/Custom_clippers.dart';
import 'views/widgets1/clip_shadow_paht.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of ذ your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      initialBinding: Binding1(),
      title: 'Flutter Demo',
      theme: ThemeData(
       // brightness: Brightness.dark, // is not restarted.
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
       

     body: ControllView(),
   

      ),
    );
  }

 
}
