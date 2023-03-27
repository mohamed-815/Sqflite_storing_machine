import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_storingdata_sqflite/core/consts/const.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customfont.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/widgets.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Personal Info"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFont(item: "Name", size: 20),
          khieght,
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(child: CustomFont(item: "place :", size: 17)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(child: CustomFont(item: "malappuram", size: 17)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(child: CustomFont(item: "Age :", size: 17)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(child: CustomFont(item: "21", size: 17)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(child: CustomFont(item: "Job :", size: 17)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(child: CustomFont(item: "Developer", size: 17)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(
                      child: CustomFont(item: " Married Status :", size: 17)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Card(child: CustomFont(item: "No", size: 17)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
