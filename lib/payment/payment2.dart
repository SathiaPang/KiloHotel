import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/constant/constant.dart';

class Payment2 extends StatefulWidget {
  const Payment2({super.key});

  @override
  State<Payment2> createState() => _Payment2State();
}

class _Payment2State extends State<Payment2> {
  int _selectOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: _buildBottonContinue(),
      body: Column(
        children: [
          //
          _buildSubTiTle(),
          _builPayPal(),
          _builGooglePay(),
          _builApplePay(),
          _buildCreditCard(),
          _builNewCard()
        ],
      ),
    );
  }

  Widget _buildSubTiTle() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Row(
          children: [
            Text(
              "Payment Methods",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  Widget _builPayPal() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: Get.height / 12,
          width: Get.width / 1.2,
          decoration: BoxDecoration(
              color: paymentcolor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.paypal,
                size: 40,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Paypal",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              _buildRadioBT(1)
            ],
          ),
        ),
      );

  Widget _builGooglePay() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: Get.height / 12,
          width: Get.width / 1.2,
          decoration: BoxDecoration(
              color: paymentcolor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.home,
                size: 40,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Google Pay",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              _buildRadioBT(2)
            ],
          ),
        ),
      );

  Widget _builApplePay() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: Get.height / 12,
          width: Get.width / 1.2,
          decoration: BoxDecoration(
              color: paymentcolor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.apple,
                size: 40,
                color: black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Apple Pay",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              _buildRadioBT(3)
            ],
          ),
        ),
      );

  Widget _buildBottonContinue() => InkWell(
        onTap: () {
          Get.toNamed(AppRoute.dialogPay);
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
                color: white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );

  Widget _buildCreditCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 25),
        child: Row(
          children: [
            Text(
              "Play with Debit/Credit Card",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )
          ],
        ),
      );

  Widget _builNewCard() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: Get.height / 12,
          width: Get.width / 1.2,
          decoration: BoxDecoration(
              color: paymentcolor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.credit_card,
                size: 40,
                color: Colors.amber,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "**** **** **** ****${"4679"}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              _buildRadioBT(4)
            ],
          ),
        ),
      );

  Widget _buildRadioBT(int value) => Radio(
        value: value,
        groupValue: _selectOption,
        activeColor: green,
        fillColor: MaterialStatePropertyAll(green),
        onChanged: (value) {
          setState(() {
            _selectOption = value ?? 0;
          });
        },
      );
}
