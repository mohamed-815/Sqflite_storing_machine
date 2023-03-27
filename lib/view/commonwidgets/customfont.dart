import 'package:flutter/material.dart';

Card CustomFont({
  required String item,
  required double size,
}) =>
    Card(
      color: Color.fromARGB(255, 7, 45, 76),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          item,
          style: TextStyle(
              fontSize: size,
              color: Color.fromARGB(255, 240, 233, 233),
              fontWeight: FontWeight.bold),
        ),
      ),
    );

Container CustomFontHead({
  required String item,
  required double size,
}) =>
    Container(
      margin: EdgeInsets.all(10),
      child: Text(
        item,
        style: TextStyle(
            fontSize: size,
            color: Color.fromARGB(255, 29, 27, 27),
            fontWeight: FontWeight.bold),
      ),
    );
