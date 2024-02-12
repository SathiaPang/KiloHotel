import 'package:flutter/material.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:get/get.dart';
import '../../constant.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenAccent,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Ticket",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //   floatingActionButton: _buildDownticket(),
      bottomNavigationBar: _buildDownticket(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Text(
                    "Intercontinenal Hotel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  _buildQR(),
                  Spacer(),
                  _buildInformation()
                ],
              ),
            ),
            Positioned(
                left: -25,
                child: Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    color: greenAccent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                )),
            Positioned(
                right: -25,
                child: Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    color: greenAccent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                )),
            DottedDashedLine(
                height: 0, width: Get.width / 1.3, axis: Axis.horizontal),
          ],
        ),
      ),
    );
  }
}

Widget _buildDownticket() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(370, 60),
          backgroundColor: green,
        ),
        onPressed: () {
          // Get.to(Login());
        },
        child: Center(
          child: Text(
            'Download Ticket',
            style: TextStyle(color: white, fontSize: 17),
          ),
        ),
      ),
    );

Widget _buildQR() => Container(
      child: Image.asset(
        "assets/images/qr.png",
        width: Get.width / 2,
      ),
    );

Widget _buildInformation() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kezia Williams',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '+234 702 2347 642',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check in',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
              Text(
                'Check out',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dec 16, 2024',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Dec 16, 2024',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hotel',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
              Text(
                'Guest',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Intercontinental Hotel',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '2',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
