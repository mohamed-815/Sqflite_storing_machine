import 'package:flutter/material.dart';

Text CustomFont({
  required String item,
  required double size,
}) =>
    Text(
      item,
      style: TextStyle(fontSize: size, color: Colors.black),
    );
