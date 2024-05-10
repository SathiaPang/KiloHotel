import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/binding/rooth_binding.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/language/language.dart';
import 'package:hotel/local/languageCatch/local_catch.dart';
import 'package:hotel/local/themeCatch/theme_catch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _languages = await LocalCatch.instance.getLangeLocale();
  final _theme = await ThemeCatch.instance.getUserTheme();
  print(_theme);
  runApp(MyApp(
    locale: _languages,
    themeUser: _theme,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.locale, required this.themeUser});
  final Locale locale;
  final bool themeUser;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: themeUser ? ThemeData.dark() : ThemeData.light(),
      translations: LanguageChange(),
      locale: locale,
      initialBinding: RootBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.load1,
      getPages: AppRoute.appPage,
    );
  }
}
