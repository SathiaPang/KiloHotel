import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';

import 'package:hotel/view/soklay/nameOfReserver.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Select Date",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      floatingActionButton: _buildBottonContinue(),
      body: Column(
        children: [
          //
          _buildSelectDate(),
          _buildChek(),
          _buildChekDetail(),
          _buildGuest(),
          _buildTotalDay(),
          _buildTotalPayment(),
        ],
      ),
    );
  }

  Widget _buildSelectDate() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: greenAccent),
          child: SfDateRangePicker(
            startRangeSelectionColor: green,
            endRangeSelectionColor: green,
            rangeSelectionColor: Color.fromARGB(255, 166, 220, 168),
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 4)),
                DateTime.now().add(const Duration(days: 3))),
          ),
        ),
      );

  Widget _buildChek() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Check in",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            Text(
              "Check out",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ],
        ),
      );

  Widget _buildChekDetail() => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Chcek In box
            Container(
              height: Get.height / 17,
              width: Get.width / 2.3,
              decoration: BoxDecoration(
                  color: boxcolor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Jan 29",
                    style: TextStyle(fontSize: 19),
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                  )
                ],
              ),
            ),

            // Icon
            Icon(
              Icons.play_arrow,
              size: 30,
            ),

            // Check out box
            Container(
              height: Get.height / 17,
              width: Get.width / 2.3,
              decoration: BoxDecoration(
                  color: boxcolor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Jan 29",
                    style: TextStyle(fontSize: 19),
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildGuest() => Padding(
        padding: const EdgeInsets.only(top: 60, left: 13),
        child: Row(
          children: [
            Text(
              "Guest",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  Widget _buildTotalDay() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: Get.height / 13,
          width: Get.width / 1.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: boxcolor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: Get.width / 7.5,
                decoration: BoxDecoration(
                    color: greenAccent,
                    borderRadius: BorderRadius.circular(13)),
                child: Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      )),
                ),
              ),
              Text(
                "10",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 50,
                width: Get.width / 7.5,
                decoration: BoxDecoration(
                    color: greenAccent,
                    borderRadius: BorderRadius.circular(13)),
                child: Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove,
                        size: 20,
                      )),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildTotalPayment() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total : \$ ${"500"}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  Widget _buildBottonContinue() => InkWell(
        onTap: () {
          Get.to(NameOfReserver());
        },
        child: Container(
          height: Get.height / 15,
          width: Get.width / 1.1,
          decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: textColor,
                  offset: Offset(1, 6),
                  blurRadius: 7,
                ),
              ]),
          child: Center(
            child: Text(
              "Continue",
              style: TextStyle(
                  color: white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
