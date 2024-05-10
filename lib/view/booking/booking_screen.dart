import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/booking_controller.dart';
import 'package:hotel/controller/refresh_controller.dart';
import 'package:hotel/view/booking/listStatus.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final BookingController _bookingController = Get.find();
  late TabController _tabController;
  final RefreshController _refreshController = Get.find();
  bool isSelected = true;

  @override
  void initState() {
    _tabController =
        TabController(length: _bookingController.maptab.length, vsync: this);
    _tabController.addListener(() {
      _bookingController.filterbyTab(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: _bookingController.maptab.length,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "myBooking".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorPadding: EdgeInsets.symmetric(vertical: 5),
              indicator: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: green,
              labelColor: white,
              controller: _tabController,
              onTap: _bookingController.filterbyTab,
              tabs: _bookingController.maptab
                  .map((e) => Tab(
                        child: Container(
                          height: Get.height / 25,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: green),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              e.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              labelPadding: EdgeInsets.symmetric(horizontal: 5),
            ),
            LiquidPullToRefresh(
              onRefresh: _refreshController.refresh,
              color: Colors.transparent,
              height: 100,
              backgroundColor: green,
              animSpeedFactor: 2,
              child: GetBuilder<BookingController>(
                builder: (_) {
                  return Expanded(
                      child: ListStatus(
                    listData: _bookingController.lstBookingShowUI,
                    onPressed: (item) =>
                        _bookingController.cancelBookink(item.id.toString()),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
