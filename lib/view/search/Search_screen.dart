import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/view/search/demoSearch.dart';
import 'package:hotel/view/search/searchList.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final Rx<Color> iconColor = Colors.black.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            _buildSearch(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: DemoSearch()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() => InkWell(
      onTap: () => showSearch(context: context, delegate: SearchItem()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: Get.height / 16,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
              Text("Search")
            ]),
          ),
        ),
      ));
}
