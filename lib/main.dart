import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/binding/rooth_binding.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';

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
      initialBinding: RootBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.load1,
      getPages: AppRoute.appPage,
    );
  }
}
