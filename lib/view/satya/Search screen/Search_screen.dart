import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/controller/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  //FindController is the name of Search Controller
  final FindController _controller = Get.put(FindController());
  final menu = ["All Hotel", "Recommended", "Popular", "Trending"];
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.35,
              child: Column(
                children: [
                  SearchBar(),
                  SizedBox(
                    height: 15,
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
            Expanded(
              child: Container(
                width: size.width * 1,
                height: size.height * 0.55,
                color: green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: borderfield.withOpacity(0.3),
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.tune,
            color: green,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
