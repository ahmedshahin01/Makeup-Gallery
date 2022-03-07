// ignore_for_file: file_names, implementation_imports, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_import, body_might_complete_normally_nullable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:makeup_api/controllers/AuthController.dart';

import '../../constance.dart';
import '../controllView.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomButtonSocial.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/customtext.dart';
import '../widgets1/Custom_clippers.dart';
import '../widgets1/clip_shadow_paht.dart';
import 'register.dart';

class LogInScrreen extends GetWidget<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          ClipShadowPath(
            clipper: BigClipper(),
            shadow: BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 8),
            child: Container(color: Colors.orangeAccent),
          ),
          ClipShadowPath(
            shadow: BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                offset: Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 8),
            clipper: SmallClipper(),
            child: Container(color: primaryColor),
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText("Welcome,", 30, Colors.black),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterScreen());
                            },
                            child: CustomText(
                              "Sign Up",
                              18,
                              Colors.black,
                            ),
                          )
                        ],
                      ),
                      CustomText(
                        "sign to continue",
                        13,
                        Color.fromARGB(255, 80, 75, 75),
                      ),
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
                            if (val == null) {
                              print("error");
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        'Forgetpassword?',
                        16,
                        Colors.black,
                        alignment: Alignment.topRight,
                      ),
                      SizedBox(height: 18),
                      CustomButton('SIGN IN', () {
                        _formKey.currentState?.save();
                        if (_formKey.currentState!.validate()) {
                          controller.SignInWithEmailAndPass();
                        }
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        '-OR-',
                        22,
                        Colors.black,
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 15),
                      CustomButtonSocial(
                        imageAssets: 'assetes/images/google.png',
                        text: 'Sign In With Google',
                        onpresed: () {
                          controller.googleSignInMethod();
                        },
                      ),
                      SizedBox(height: 20),
                      CustomButtonSocial(
                        onpresed: () {
                          controller.signInWithFacebookAccount();
                        },
                        imageAssets: 'assetes/images/facebook.png',
                        text: 'Sign In With FaceBook',
                      ),
                      SizedBox(height: 20),
                      CustomButton('Gest Vistor', () {
                        Get.offAll(() => ControllView());
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
