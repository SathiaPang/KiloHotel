import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
    List<Widget> list = [];
    for (int i = 0; i < menu.length; i++) {
      list.add(buildTab(menu[i], i));
    }
    return list;
  }

  Widget buildTab(String label, int index) {
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
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
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
          ],
        ),
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
