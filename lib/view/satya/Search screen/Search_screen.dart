import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant.dart';
import 'package:hotel/controller/search_controller.dart';

import 'package:hotel/tabbar/tabbar.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final FindController _findController = Get.find();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _findController.searchcategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
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
                    TabbarEdit(
                        _tabController,
                        _findController.searchcategory,
                        _findController.selectedIndex.value,
                        (index) => _findController.filTerByIndex(index)),
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
          child: IconButton(
            onPressed: () {
              print("You touch my button");
            },
            icon: Icon(
              Icons.tune,
              color: green,
            ),
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
