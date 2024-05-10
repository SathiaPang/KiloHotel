import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/login_controller.dart';
import 'package:hotel/controller/homeScreenController.dart';
import 'package:hotel/controller/refresh_controller.dart';
import 'package:hotel/view/home/demoData.dart';
import 'package:hotel/view/search/searchList.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final LoginController _loginController = Get.find();
  final ProfileScreenController _profileScreenController = Get.find();
  final RefreshController _refreshController = Get.find();

  @override
  void initState() {
    _loginController.getToken();
    super.initState();
    Get.find<ProfileScreenController>().getPrfileData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              height: Get.height / 20,
              width: Get.width / 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "Bolu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ],
        ),
        // Action
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: SearchItem()),
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.setting);
              },
              icon: Icon(
                Icons.settings_outlined,
                size: 30,
              )),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        children: [
          //
          _builNickName(),
          // LiquidPullToRefresh(
          //     onRefresh: _refreshController.refresh,
          //     height: 100,
          //     backgroundColor: green,
          //     animSpeedFactor: 2,
          //     child: _buildData()),,
          _buildData(),
          _builSeeAll()
        ],
      ),
    );
  }

  Widget _buildData() => Expanded(child: DemoData());

  Widget _builSeeAll() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "other".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(AppRoute.recenly);
                },
                child: Text(
                  "seeall".tr,
                  style: TextStyle(
                      color: green, fontSize: 20, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      );

  Widget _builNickName() => Obx(
        () => _profileScreenController.isLoading.value
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'hello'.tr,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${_profileScreenController.profileModel.value!.data!.name.toString()}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            : CircularProgressIndicator(),
      );

  @override
  bool get wantKeepAlive => true;
}
