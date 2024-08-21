import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/auth_model.dart';
import 'package:ecommerceapp/view/home_screen.dart';
import 'package:ecommerceapp/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth fireauth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> signupAuth(
    String email,
    String password,
    String username,
    BuildContext context,
  ) async {
    UserCredential credential = await fireauth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = credential.user;

    if (user != null) {
      AuthModel authmodel = AuthModel(
        email: email,
        userid: user.uid,
        username: username,
      );
      await firestore.collection('users').doc(user.uid).set(authmodel.tojson());
      log('sign up success');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
    } else {
      Navigator.pop(context);
    }
  }

  Future<User?> loginAuth(
      String email, String password, BuildContext context) async {
    UserCredential credential = await fireauth.signInWithEmailAndPassword(
        email: email, password: password);

    if (fireauth.currentUser!.emailVerified) {
      return credential.user;
    }
    log('sign in success');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ));
  }
}
