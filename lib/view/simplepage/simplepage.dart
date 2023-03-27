import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customfont.dart';
import 'package:login_storingdata_sqflite/view/homepage/personaldata.dart';

class SimplePage extends StatelessWidget {
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () async {
              await Get.offAll(PersonalData());
            },
            child: CustomFont(item: 'Go To Personal Info', size: 20)),
      ),
    );
  }
}
