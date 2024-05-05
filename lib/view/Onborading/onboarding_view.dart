import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/component/splashScreen/botton.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/view/Onborading/onboarding_list.dart';
import 'package:hotel/view/splashScreen/loading2.dart';
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
      bottomSheet: Container(
        color: white,
        height: Get.height / 5,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: lastPage
            ? _buildGetStart(context)
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: pagecontroller,
                    count: controller.items.length,
                    effect: WormEffect(activeDotColor: green),
                  ),
                  SplashScreenBotton(
                    text: "Next",
                    textcolor: white,
                    fontSize: 25,
                    backgroundColor: green,
                    onPressed: () => pagecontroller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                  ),
                  SplashScreenBotton(
                      text: "Skip",
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
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(controller.items[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        controller.items[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.items[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: textColor),
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
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green,
        ),
        width: MediaQuery.of(context).size.width * .9,
        child: TextButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool("onboarding", true);

            if (!mounted) return;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Loading2(),
              ),
            );
          },
          child: const Text(
            "Get started",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
