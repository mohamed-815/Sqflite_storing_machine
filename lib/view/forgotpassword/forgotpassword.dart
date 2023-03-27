import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/controller/emailcontroller.dart';
import 'package:login_storingdata_sqflite/core/consts/const.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customfont.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customtextformfiled.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/widgets.dart';
import 'package:login_storingdata_sqflite/view/reginsterpage/reginster.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Register For New Password'),
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
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Implement login logic with _email and _password
                    LoginController()
                        .resetPassword(email: _email.text, context: context);
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
