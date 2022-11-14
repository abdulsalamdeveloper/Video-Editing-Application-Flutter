import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'WorkSans',
        scaffoldBackgroundColor: Color(0xffF9F9FB),
      ),
      title: "VideoEditingApp",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
