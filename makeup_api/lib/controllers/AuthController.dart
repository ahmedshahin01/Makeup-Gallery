// ignore_for_file: prefer_final_fields, unused_field, non_constant_identifier_names, avoid_print, prefer_const_constructors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart'; 

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:makeup_api/views/controllView.dart';

import '../models/userModel.dart';
import '../services/userService.dart';

class AuthController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
   String? email, password, name;
  Rxn<User>? _user = Rxn<User>();
  String? get user => _user?.value?.email;

  ///
  @override
  onInit(){
    
    super.onInit();
    _user!.bindStream(_auth.authStateChanges());

  }

  
   FacebookAuth _facebookAuth = FacebookAuth.instance;
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
    //print(googleuser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleuser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
    });
    Get.offAll(() => ControllView());
  }

  void signInWithFacebookAccount() async {
    try {
      final _facebookSignIn = await FacebookAuth.instance.login();

      final _facebookAuthCredential =
           FacebookAuthProvider.credential(_facebookSignIn.accessToken!.token);

      await _auth.signInWithCredential(_facebookAuthCredential)
      .then((user) {
        saveUser(user);
      });
      Get.offAll(ControllView());
    } catch (error) {
      Get.snackbar(
        'Failed to login..',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 10)
      );
    }
  }
  void SignInWithEmailAndPass() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      Get.offAll(()=>ControllView());
    } catch (e) {
      print(e);
      Get.snackbar('error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
  void SignupWithEmailAndPass() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(()=>ControllView());
    } catch (e) {
      print(e);
      Get.snackbar('error login account', e.toString(),
          colorText:Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
    
  }

   void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        email: user.user!.email.toString(),
        name:
            name == null ? user.user!.displayName.toString() : name.toString(),
        pic: ''));
  }

}
