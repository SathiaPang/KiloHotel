import 'package:flutter/material.dart';

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
      floatingActionButton: _buildDownticket(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 100),
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
          ],
        ),
      ),
    );
  }
}

Widget _buildDownticket() => ElevatedButton(
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
    );
