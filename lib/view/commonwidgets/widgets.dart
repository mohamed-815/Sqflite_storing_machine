import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_storingdata_sqflite/controller/emailcontroller.dart';

AppBar CustomAppBar({required String title, IconData? icondata}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () async {
            await LoginController().logOut().then((value) => log('logout'));
          },
          child: Icon(
            icondata,
            color: Colors.black,
          ),
        ),
      )
    ],
  );
}
