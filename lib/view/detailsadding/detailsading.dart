import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/controller/dbrepo/dbrepo.dart';
import 'package:login_storingdata_sqflite/model/personmodel/personmodel.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customtextformfiled.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/widgets.dart';
import 'package:login_storingdata_sqflite/view/homepage/personaldata.dart';
import 'package:login_storingdata_sqflite/view/simplepage/simplepage.dart';

class DetailsAdding extends StatelessWidget {
  DetailsAdding({super.key, required this.isupdate, this.person});
  final bool isupdate;
  final Person? person;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _place = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _job = TextEditingController();
  TextEditingController _marrgestatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _name.text = person?.name ?? _name.text;
      _place.text = person?.place ?? _place.text;
      _job.text = person?.job ?? _job.text;
      _age.text = person?.age.toString() ?? _age.text;
      _marrgestatus.text = person?.isMarried.toString() ?? _marrgestatus.text;
    });
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
                  controller: _marrgestatus,
                  labeltext: "marriage Status",
                  validationtext: "please enter your Status"),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final personnew = Person(
                        id: person?.id,
                        name: _name.text.trim().toString(),
                        age: int.parse(_age.text.trim()),
                        isMarried: _marrgestatus.text.trim().toString(),
                        job: _job.text.trim().toString(),
                        place: _place.text.trim().toString());
                    controllerClear();
                    log(isupdate.toString());
                    log(personnew.id.toString());
                    if (isupdate) {
                      try {
                        await DatabaseHelper.instance
                            .updatePerson(personnew)
                            .then((value) => Get.off(const PersonalData()));
                        controllerClear();
                      } catch (e) {
                        e.toString();
                      }
                    } else {
                      await DatabaseHelper.instance
                          .insertPerson(personnew)
                          .then((value) => log("$value.toString()"))
                          .catchError((error) {
                        Get.off(SimplePage());
                      });
                      controllerClear();
                    }
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

  controllerClear() {
    _name.clear();
    _place.clear();
    _age.clear();
    _job.clear();
    _marrgestatus.clear();
  }
}
