// ignore_for_file: file_names, implementation_imports, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_import, body_might_complete_normally_nullable, avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_api/controllers/AuthController.dart';

import '../widgets/CustomButton.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/customtext.dart';
import '../widgets1/Custom_clippers.dart';
import '../widgets1/clip_shadow_paht.dart';
import 'Login.dart';

class RegisterScreen extends GetWidget<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.off(LogInScrreen());
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(96, 44, 43, 43),
      ),
      body: Stack(
        children: [
          ClipShadowPath(
            clipper: BigClipper(),
            shadow: BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 8),
            child: Container(color: Colors.blueAccent),
          ),
          ClipShadowPath(
            shadow: BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                offset: Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 8),
            clipper: SmallClipper(),
            child: Container(color: Colors.blue),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomText("Sign Up,", 30, Colors.black),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFormFiled(
                        text: 'Name',
                        hint: 'Enter Your Name',
                        onSave: (val) {
                          controller.name = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty || val.length < 4)
                            return 'Please enter valid name.';
                        }),
                    SizedBox(height: 30),
                    CustomTextFormFiled(
                        text: 'E-Mail',
                        hint: 'Enter your e-mail',
                        onSave: (val) {
                          controller.email = val;
                        },
                        validator: (val) {
                          if (val == null) {
                            print("error");
                          }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormFiled(
                        text: 'PassWord',
                        hint: '*********',
                        onSave: (val) {
                          controller.password = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty || val.length < 4)
                            return 'Please enter valid password with at least 6 characters.';
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 18),
                    CustomButton('SIGN Up', () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        controller.SignupWithEmailAndPass();
                      }
                    }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
