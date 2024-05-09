import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/binding/rooth_binding.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/language/language.dart';
import 'package:hotel/local/languageCatch/local_catch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _languages = await LocalCatch.instance.getLangeLocale();
  runApp(MyApp(
    locale: _languages,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.locale});
  final Locale locale;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: black),
        useMaterial3: true,
      ),
      translations: LanguageChange(),
      locale: locale,
      initialBinding: RootBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.load1,
      getPages: AppRoute.appPage,
    );
  }
}
