import 'package:flutter/material.dart';
import 'package:hotel/data/data.dart';
import '../constant.dart';

class TabbarEdit extends StatelessWidget {
  TabbarEdit(
    this.tabController,
    this.categoryList,
    this.selectedIndex,
    this.onTap,
  );

  final TabController tabController;
  final List<RoomCategory> categoryList;
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) => TabBar(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        controller: tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        indicatorPadding: EdgeInsets.zero,
        onTap: onTap,
        // indicator: BoxDecoration(
        //     color: green, borderRadius: BorderRadius.circular(15)),
        tabs: categoryList.map((RoomCategory roomCategory) {
          final isSelected = categoryList[selectedIndex] == roomCategory;
          return Tab(
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: isSelected ? green : white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: green)),
              child: Center(
                child: Text(
                  roomCategory.tab,
                  style: TextStyle(color: isSelected ? white : green),
                ),
              ),
            ),
          );
        }).toList(),
      );
}
