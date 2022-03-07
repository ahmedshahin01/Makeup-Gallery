// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'customtext.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String text;

  final String hint;

  final FormFieldSetter<String>? onSave;
  final FormFieldValidator<String>? validator;

  CustomTextFormFiled(
      {required this.text, required this.hint, this.onSave, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            CustomText(
              text,
              17,
              Colors.black,
              fontWeight: FontWeight.bold,
            ),
            TextFormField(
              onSaved: onSave,
              validator: validator,
              decoration: InputDecoration(
                  hintText: hint,
                  // ignore: prefer_const_constructors
                  hintStyle: TextStyle(color: Color.fromARGB(255, 58, 48, 48)),
                  fillColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
