import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/data/data.dart';

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

    _tabController.addListener(() {
      _homeController.filTerByIndex(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      fit: BoxFit.contain)),
            ),
            SizedBox(
              width: 10,
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
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_outline,
                size: 30,
              )),
        ],
      ),
      body: Column(
        children: [
          //
          _builNickName(),
          _buildSearch(),

          Container(
            child: TabBar(
                controller: _tabController,
                tabs: _homeController.roomcategorys
                    .map((RoomCategory roomCategory) {
                  return Text(roomCategory.tab);
                }).toList()),
          )
        ],
      ),
    );
  }

  Widget _builNickName() => Padding(
        padding: const EdgeInsets.only(top: 5, left: 15),
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
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: Get.height / 15,
          width: Get.width / 1.1,
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
              )
            ],
          ),
        ),
      );
  @override
  bool get wantKeepAlive => true;
}
