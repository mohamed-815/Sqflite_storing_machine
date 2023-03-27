import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/controller/emailcontroller.dart';
import 'package:login_storingdata_sqflite/core/consts/const.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customfont.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customtextformfiled.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/widgets.dart';
import 'package:login_storingdata_sqflite/view/reginsterpage/reginster.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Login'),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                  boo: false,
                  controller: _email,
                  labeltext: "Email",
                  validationtext: "please enter your email"),
              CustomTextFormField(
                  boo: true,
                  controller: _password,
                  labeltext: "Password",
                  validationtext: "please enter your password"),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  kwidth,
                  kwidth,
                  kwidth,
                  kwidth,
                  kwidth,
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // TODO: Implement login logic with _email and _password
                        LoginController().register(_email.text, _password.text);
                      }
                    },
                    child: Text('Login'),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(ReginsterPage());
                      },
                      child: CustomFont(item: "Creat New", size: 20))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
