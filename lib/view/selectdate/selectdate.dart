import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/controller/name_of_reservation_controller.dart';
import 'package:hotel/controller/selectDateController.dart';
import 'package:hotel/view/selectdate/totalGuest.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  final SelectDateController _selectDateController = Get.find();
  final NameOfReservationController _nameOfReservationController = Get.find();
  final list = Get.arguments;
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
      bottomNavigationBar: _buildContinue(),
      body: Obx(
        () => Column(
          children: [
            //
            _buildSelectDate(),
            _buildChek(),
            _buildChekDetail(),
            SizedBox(
              height: 10,
            ),
            _buildGuest("Adult"),
            TotalGuest(
                text: _selectDateController.personQtyAdult.toString(),
                onpressAdd: () => _selectDateController.increasment(),
                onpressREmove: () => _selectDateController.decreasment()),
            SizedBox(
              height: 5,
            ),
            _buildGuest("Child"),
            TotalGuest(
                text: _selectDateController.personQtyChild.toString(),
                onpressAdd: () => _selectDateController.increasmentChld(),
                onpressREmove: () => _selectDateController.decreasmentChild()),
            _buildTotalPayment(),
          ],
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      PickerDateRange dateRange = args.value as PickerDateRange;

      dateRange.startDate != null
          ? _selectDateController.selectDate(dateRange.startDate!)
          : _selectDateController.selectDate(DateTime.now());

      if (dateRange.endDate != null) {
        _selectDateController.endDate(dateRange.endDate!);
      } else {}
    }
  }

  Widget _buildSelectDate() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SfDateRangePicker(
            startRangeSelectionColor: green,
            endRangeSelectionColor: green,
            rangeSelectionColor: Color.fromARGB(255, 166, 220, 168),
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.range,
            initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(const Duration(days: 0)),
                DateTime.now().add(const Duration(days: 0))),
          ),
        ),
      );

  Widget _buildChek() => Padding(
        padding: const EdgeInsets.only(top: 5),
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

  Widget _buildChekDetail() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Chcek In box
          Container(
            height: Get.height / 20,
            width: Get.width / 2.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: greenAccent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${_selectDateController.selectedDate}",
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
            height: Get.height / 20,
            width: Get.width / 2.3,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: greenAccent),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${_selectDateController.nDate}",
                  style: TextStyle(fontSize: 19),
                ),
                Icon(
                  Icons.calendar_month_outlined,
                )
              ],
            ),
          ),
        ],
      );

  Widget _buildGuest(String text) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Row(
          children: [
            Text(
              "${text}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Widget _buildTotalPayment() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total : \$ ${_selectDateController.totalPayment()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  Widget _buildContinue() => InkWell(
        onTap: () => _nameOfReservationController.saveBooking(list),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
        ),
      );
}
