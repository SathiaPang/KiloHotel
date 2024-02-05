import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/controller/home_controller.dart';
import 'package:hotel/view/home/room.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController _controller = Get.put(HomeController());
  final menu = ["Recommended", "Popular", "Trending"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: menu.length, vsync: this);
    _tabController.addListener(() {
      _controller.setTabActivate(_tabController.index);
      _controller.filterByTab(menu[_tabController.index]);
    });
  }

  List<Widget> _buildTabUI() {
    return menu.map((label) => buildTab(label)).toList();
  }

Widget buildTab(
    String label, 
  ) {

  Widget buildTab(String label) {
    int index = menu.indexOf(label);
    bool isActive = _controller.activateTab.value == index;

    return GestureDetector(
      onTap: () {
        _controller.setTabActivate(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: green),
          color: isActive ? green : white,
        ),
        height: Get.height / 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isActive ? white : green,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,Kenzia',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildSearch(),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  tabAlignment: TabAlignment.start,
                  tabs: _buildTabUI(),
                ),
              ),
              // Spacer(),
              SizedBox(
                height: Get.height / 1.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoomView(),
                    );
                  },
                ),
              ),
              _buildSeeMore()
            ],
          ),
        ],
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: Row(
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: Get.height / 17,
              ),
              const SizedBox(width: 8),
              Text(
                'Bolu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bookmark_border_outlined),
              onPressed: () {},
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildSearch() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: Get.height / 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text("Search"),
                    Spacer(),
                    Icon(Icons.tune)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );

Widget _buildSeeMore() => Container(
      // height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recently Booked',
            style: TextStyle(
                color: black, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 16, color: green),
              ))
        ],
      ),
    );
