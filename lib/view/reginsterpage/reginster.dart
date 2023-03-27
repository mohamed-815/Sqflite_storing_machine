import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/controller/emailcontroller.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customtextformfiled.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/widgets.dart';
import 'package:login_storingdata_sqflite/view/homepage/personaldata.dart';

class ReginsterPage extends StatefulWidget {
  @override
  _ReginsterPageState createState() => _ReginsterPageState();
}

class _ReginsterPageState extends State<ReginsterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Register'),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                  boo: false,
                  controller: _email,
                  labeltext: "Email",
                  validationtext: "please enter your email"),
              CustomTextFormField(
                  boo: true,
                  controller: _password,
                  labeltext: "password",
                  validationtext: "please enter your password"),
              CustomTextFormField(
                  boo: true,
                  controller: _password2,
                  labeltext: "password",
                  validationtext: "please enter your password"),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  print("${_password.text}..............${_password2.text}");

                  if (_password.text.trim().toString() ==
                      _password2.text.trim().toString()) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      log("$_email ffkffkkfkfkfkk");
                      LoginController().register(_email.text.trim().toString(),
                          _password.text.trim().toString());
                      // TODO: Implement login logic with _email and _password
                      if (FirebaseAuth.instance.currentUser != null) {
                        Get.to(PersonalData());
                      }
                    }
                  } else {
                    Get.snackbar('Password', "Password is not equal",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
