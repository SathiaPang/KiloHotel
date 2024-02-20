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
  final Rx<Color> iconColor = Colors.black.obs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _findController.searchcategory.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: Get.width * 1,
                height: Get.height * 0.19,
                color: white,
                child: Column(
                  children: [
                    SearchBar(),
                    SizedBox(height: 15),
                    TabbarEdit(
                      _tabController,
                      _findController.searchcategory,
                      _findController.selectedIndex.value,
                      (index) => _findController.filTerByIndex(index),
                    ),
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Recommended ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: '(484,579)',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: _findController.click.value
                                        ? green
                                        : black,
                                  ),
                                  onPressed: _findController.changeToList,
                                ),
                                IconButton(
                                  onPressed: _findController.changeToGrid,
                                  icon: Icon(
                                    Icons.grid_view_outlined,
                                    color: _findController.click.value
                                        ? black
                                        : green,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<FindController>(
                    // Initialize the controller
                    builder: (controller) {
                      return controller.isGridVisible.value
                          ? _buildGridList(iconColor)
                          : _buildStackList(iconColor);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _ListItemView() => Expanded(
  //       child: DemoSearch(hotelList: _findController.repo),
  //     );
}

Widget _buildStackList(Rx<Color> iconColor) => ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/images/hotel.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'International Hotel',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'New York, USA',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              '5.0',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.green),
                            ),
                            SizedBox(width: 5),
                            Text("(4,345 reviews)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$205",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("/night"),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            iconColor.value = iconColor.value == Colors.black
                                ? Colors.green
                                : Colors.black;
                          },
                          icon: Icon(Icons.bookmark),
                          color: iconColor.value,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

Widget _buildGridList(Rx<Color> iconColor) => GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          childAspectRatio: 1.2 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  height: Get.height / 5,
                  width: Get.width / 1.5,
                  // width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hotel.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'International Hotel',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '5.0',
                          style: TextStyle(fontSize: 17, color: Colors.green),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'New York, USA',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$205 ',
                            style: TextStyle(
                                fontSize: Get.width / 20, color: green),
                          ),
                          TextSpan(
                            text: '/night',
                            style: TextStyle(
                                // fontSize: Get.width * 0.07,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          iconColor.value = iconColor.value == Colors.black
                              ? Colors.green
                              : Colors.black;
                        },
                        icon: Icon(Icons.bookmark),
                        color: iconColor.value,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
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
