import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user.dart' as model;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    return model.User.fromSnap(snap);
  }

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        debugPrint(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('ProfilePictures', file, false);

        // Add user data to our database

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some Error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
