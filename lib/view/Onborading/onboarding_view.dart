import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/component/splashScreen/botton.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/view/Onborading/onboarding_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pagecontroller = PageController();
  final controller = OnbordingItems();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomSheet: Container(
        color: white,
        height: Get.height / 3.5,
        child: lastPage
            ? Column(
                children: [
                  _buildGetStart(context),
                ],
              )
            : Column(
                children: [
                  SmoothPageIndicator(
                    controller: pagecontroller,
                    count: controller.items.length,
                    effect: WormEffect(activeDotColor: green),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SplashScreenBotton(
                    text: "next".tr,
                    textcolor: white,
                    fontSize: 25,
                    backgroundColor: green,
                    onPressed: () => pagecontroller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SplashScreenBotton(
                      text: "skip".tr,
                      onPressed: () {
                        Get.offAndToNamed(AppRoute.load2);
                      },
                      backgroundColor: greenAccent,
                      textcolor: green,
                      fontSize: 25),
                ],
              ),
      ),
      body: PageView.builder(
          onPageChanged: (index) =>
              setState(() => lastPage = index == controller.items.length - 1),
          controller: pagecontroller,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(controller.items[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Text(
                        controller.items[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.items[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: textColor),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget _buildGetStart(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: green,
      ),
      height: Get.height / 10,
      width: Get.width / 1.5,
      child: TextButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool("onboarding", true);

          if (!mounted) return;
          Get.toNamed(AppRoute.load2);
        },
        child: Text(
          "getStart".tr,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
