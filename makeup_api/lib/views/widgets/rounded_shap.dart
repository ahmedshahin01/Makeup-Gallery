

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'customtext.dart';

class RoundedShapeInfo extends StatelessWidget {
  final String title;
  final Widget content;
  final double fontSize;

   RoundedShapeInfo({
    required this.title,
    required this.content,
     this.fontSize=16
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(title, fontSize, Colors.black,alignment: Alignment.center,)
           
            ,content,
          ],
        ),
      ),
    );
  }
}
