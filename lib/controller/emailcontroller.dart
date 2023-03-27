import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_storingdata_sqflite/view/homepage/personaldata.dart';
import 'package:login_storingdata_sqflite/view/loginpage/loginpage.dart';

class LoginController extends GetxController {
  late Rx<User?> _user;
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(instance.currentUser);
    ever(_user, _initialScreen);
  }

  _initialScreen(user) {
    if (user != null) {
      Get.to(PersonalData());
    } else {
      Get.to(LoginScreen());
    }
  }

  void register(String email, password) async {
    log("$email....$password");
    try {
      await instance.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('about user', 'User message',
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('failed'),
          messageText: Text(e.toString()));
    }
  }

  void login(String email, password) async {
    try {
      await instance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('about user', 'User message',
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('login failed'),
          messageText: Text(e.toString()));
    }
  }

  void logOut() {
    instance.signOut();
  }
}
