import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/view/booking/recently.dart';
import 'package:hotel/view/home/demoCategory.dart';
import '../../tabbar/tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  final HomeController _homeController = Get.find();

  @override
  void initState() {
    _tabController = TabController(
        length: _homeController.roomcategorys.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() => Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: white,
            title: Row(
              children: [
                Container(
                  height: Get.height / 20,
                  width: Get.width / 12,
                  decoration: BoxDecoration(
                    // color: green,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )
              ],
            ),
            // Action
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    Get.to(RecentlyScreen());
                  },
                  icon: Icon(
                    Icons.bookmark_outline,
                    size: 30,
                  )),
              SizedBox(
                width: 4,
              )
            ],
          ),
          body: Column(
            children: [
              //
              _builNickName(),
              _buildSearch(),
              TabbarEdit(
                  _tabController,
                  _homeController.roomcategorys,
                  _homeController.selectedIndex.value,
                  (index) => _homeController.filTerByIndex(index)),
              _builSeeAll(),
              _buildTabbarView(),
            ],
          ),
        ));
  }

  Widget _buildTabbarView() => Expanded(
          child: DemoCategory(
        hotelList: _homeController.repo,
      ));

  Widget _builSeeAll() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "RecentlyBooked",
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(RecentlyScreen());
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: green, fontSize: 20, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      );

  Widget _builNickName() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              "Hello, So LayZz",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  Widget _buildSearch() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: InkWell(
          onTap: () {
            // Get.to(SearchScreen());
          },
          child: Container(
            height: Get.height / 15,
            width: double.infinity,
            decoration: BoxDecoration(
                color: textfieldcolor, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search_outlined,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search",
                  style: TextStyle(fontSize: 17),
                ),
                Spacer(),
                Icon(
                  Icons.tune,
                  color: green,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
      );
  @override
  bool get wantKeepAlive => true;
}
