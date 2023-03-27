import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customtextformfiled.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/widgets.dart';

class DetailsAddingPage extends StatefulWidget {
  @override
  _DetailsAddingPageState createState() => _DetailsAddingPageState();
}

class _DetailsAddingPageState extends State<DetailsAddingPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _place = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _job = TextEditingController();
  TextEditingController _marrgestatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Details'),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                  boo: false,
                  controller: _name,
                  labeltext: "Name",
                  validationtext: "please enter your Name"),
              CustomTextFormField(
                  boo: false,
                  controller: _place,
                  labeltext: "place",
                  validationtext: "please enter your place"),
              CustomTextFormField(
                  boo: false,
                  controller: _age,
                  labeltext: "age",
                  validationtext: "please enter your age"),
              CustomTextFormField(
                  boo: false,
                  controller: _job,
                  labeltext: "job",
                  validationtext: "please enter your job"),
              CustomTextFormField(
                  boo: false,
                  controller: _age,
                  labeltext: "marriage Status",
                  validationtext: "please enter your Status"),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Implement login logic with _email and _password
                  } else {
                    Get.snackbar('', "Error Please fill correct",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
