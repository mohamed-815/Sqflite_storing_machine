import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:login_storingdata_sqflite/controller/dbrepo/dbrepo.dart';
import 'package:login_storingdata_sqflite/core/consts/const.dart';
import 'package:login_storingdata_sqflite/model/personmodel/personmodel.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/customfont.dart';
import 'package:login_storingdata_sqflite/view/commonwidgets/widgets.dart';

import 'package:login_storingdata_sqflite/view/detailsadding/detailsading.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: "Personal Info", icondata: Icons.logout_outlined),
      body: FutureBuilder(
          future: DatabaseHelper.instance.getPerson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Person? item = snapshot.data;

              return Card(
                color: Color.fromARGB(255, 3, 33, 57),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomFont(item: item!.name, size: 20),
                          Column(
                            children: [
                              iconWidget(
                                  item: item!,
                                  fun: () async {
                                    await DatabaseHelper.instance
                                        .deletePerson()
                                        .then(
                                            (value) => Get.off(PersonalData()))
                                        .catchError((error) {
                                      log('error');
                                    });
                                    setState(() {});
                                  },
                                  icon: Icons.delete),
                              iconWidget(
                                  item: item!,
                                  fun: () {
                                    Get.to(DetailsAdding(
                                        isupdate: true, person: item));
                                  },
                                  icon: Icons.edit),
                            ],
                          )
                        ],
                      ),
                    ),
                    khieght,
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Card(
                                child: CustomFont(item: "place :", size: 17)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Card(
                                child: CustomFont(item: item!.place, size: 17)),
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
                            child: Card(
                                child: CustomFont(item: "Age :", size: 17)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Card(
                                child: CustomFont(
                                    item: item!.age.toString(), size: 17)),
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
                                child: CustomFont(item: "Job :", size: 17)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Card(
                                child: CustomFont(item: item!.job, size: 17)),
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
                                child: CustomFont(
                                    item: " Marriage Status :", size: 17)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.h),
                            child: Card(
                                child: CustomFont(
                                    item: item!.isMarried, size: 17)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return CustomFont(item: 'Some Thing Went Wrong', size: 20);
            } else {
              return Center(
                child: TextButton(
                  child: CustomFont(item: 'Add Personal info', size: 20),
                  onPressed: () {
                    Get.to(DetailsAdding(
                      isupdate: false,
                    ));
                  },
                ),
              );
            }
          }),
    );
  }

  GestureDetector iconWidget(
      {required Person item,
      required void Function() fun,
      required IconData icon}) {
    return GestureDetector(
      onTap: fun,
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 14, 22, 74),
        child: Icon(icon),
      ),
    );
  }
}
