// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userModel.dart'; 

class FireStoreUser {
  final CollectionReference _collectionRefer =
      FirebaseFirestore.instance.collection('user');
      //
      
      //
  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _collectionRefer.doc(userModel.userId).set(userModel.toJson());
  }
}
 