import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/binding/controlbinding.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/view/Profile/profile.dart';
import 'package:hotel/view/splashScreen/loading1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: black),
          useMaterial3: true,
        ),
        initialBinding: ControllerBinding(),
        debugShowCheckedModeBanner: false,
        home: BookDetailScreenOne());
  }
}
