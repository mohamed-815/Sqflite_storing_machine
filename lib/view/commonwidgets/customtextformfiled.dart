import 'package:flutter/material.dart';

Padding CustomTextFormField(
    {required String labeltext,
    required String validationtext,
    required bool boo,
    required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      controller: controller,
      obscureText: boo,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.black),
        focusColor: Color.fromARGB(255, 44, 43, 43),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: labeltext,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationtext;
        }
        return null;
      },
    ),
  );
}
