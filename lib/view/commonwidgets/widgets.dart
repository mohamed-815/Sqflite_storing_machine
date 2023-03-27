import 'package:flutter/material.dart';

AppBar CustomAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
  );
}
