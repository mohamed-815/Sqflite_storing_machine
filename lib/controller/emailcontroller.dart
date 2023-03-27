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

    _initialScreen(_user.value);
    // ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
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
      await instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => log('Success'));

      if (instance.currentUser != null) {
        Get.off(PersonalData());
      }
    } catch (e) {
      Get.snackbar('about user', 'User message',
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('login failed'),
          messageText: Text(e.toString()));
    }
  }

  Future<void> logOut() async {
    await instance.signOut();
  }

  resetPassword({required String email, required BuildContext context}) {
    instance
        .sendPasswordResetEmail(email: email)
        .then((value) => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Password Reset Email Sent!'),
                  content: Text(
                      'Please check your email and follow the instructions to reset your password.'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            ))
        .catchError((error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to send password reset email: $error'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }
}
