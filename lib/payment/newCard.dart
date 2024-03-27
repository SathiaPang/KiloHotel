import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';

import 'package:hotel/view/soklay/payment2.dart';

class NewCard extends StatelessWidget {
  const NewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "New Card",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: _buildBottonAddNewCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            _cardBank(),
            _builFullName(),
            _builCardNumber(),
            _builDateAndCvv()
          ],
        ),
      ),
    );
  }

  Widget _cardBank() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: Get.height / 3.9,
              width: Get.width / 1.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/cardbank.jpg"),
                      fit: BoxFit.contain)),
            ),
          ),
        ],
      );

  Widget _builFullName() => Padding(
        padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: textfieldcolor,
            labelText: "Full Name",
            labelStyle: TextStyle(color: black, fontWeight: FontWeight.w400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      );

  Widget _builCardNumber() => Padding(
        padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: textfieldcolor,
            labelText: "card Number",
            labelStyle: TextStyle(color: black, fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );

  Widget _builDateAndCvv() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Date
            Container(
              height: Get.height / 14,
              width: Get.width / 2.7,
              decoration: BoxDecoration(
                  color: textfieldcolor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: black)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "date",
                    hintStyle:
                        TextStyle(color: black, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),

            // Cvv
            Container(
              height: Get.height / 14,
              width: Get.width / 2.7,
              decoration: BoxDecoration(
                  color: textfieldcolor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: black)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "cvv",
                    hintStyle:
                        TextStyle(color: black, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ],
        ),
      );

  Widget _buildBottonAddNewCard() => InkWell(
        onTap: () {
          Get.to(const Payment2());
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
              "Add New Card",
              style: TextStyle(
                color: white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );
}
