import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';
import 'package:hotel/view/Profile/ticket.dart';
import 'package:hotel/view/dialogPayment/dialogPayment.dart';

class PaymentBooking extends StatelessWidget {
  const PaymentBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenAccent,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: _buildBottonContinue(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            _buildListRoom(),
            SizedBox(
              height: 30,
            ),
            _buildDate(),
            SizedBox(
              height: 30,
            ),
            _buildTotalDetail(),
            SizedBox(
              height: 30,
            ),
            _buildCard(),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}

Widget _buildListRoom() => Container(
      height: 120,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: white),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/hotel.jpg'), // Corrected path
                  fit: BoxFit.cover, // Specify the fit
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Internation Hotela',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'New  York, USA',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      '5.0',
                      style: TextStyle(fontSize: 17, color: green),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("(4,345 reviews)")
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$205",
                  style: TextStyle(
                      color: green, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("/night "),
                Spacer(),
                Container(
                  height: 30,
                  width: 40,
                  color: Colors.grey.shade400,
                )
              ],
            ),
          ],
        ),
      ),
    );

Widget _buildDate() => Container(
      height: 140,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: white),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Check in', style: TextStyle(fontSize: 17)),
                Text(
                  "December 16, 2024",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Check out', style: TextStyle(fontSize: 17)),
                Text(
                  "December 16, 2024",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Guest', style: TextStyle(fontSize: 17)),
                Text(
                  "3",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
Widget _buildTotalDetail() => Container(
      height: 150,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: white),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('5 night', style: TextStyle(fontSize: 17)),
                Text(
                  "\$760.00",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taxes & Fees(10%)", style: TextStyle(fontSize: 17)),
                Text(
                  "\$760.00",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              height: 1,
              width: Get.width / 1.2,
              color: black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 17)),
                Text(
                  "\$760.00",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );

Widget _buildCard() => Container(
      height: Get.height / 12,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(15)),
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
          _buildTextButton()
        ],
      ),
    );

Widget _buildTextButton() => TextButton(
    onPressed: () {},
    child: Text(
      "Change",
      style: TextStyle(color: green, fontSize: 17),
    ));

Widget _buildBottonContinue(BuildContext context) {
  return InkWell(
    onTap: () {
      Get.dialog(DialogPayMent());
    },
    child: Container(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(1, 6),
            blurRadius: 7,
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildcancel(BuildContext context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(275, 60),
          backgroundColor: Colors.green.shade100,
        ),
        onPressed: () {
          Navigator.pop(context); // Navigate back when cancel is pressed
        },
        child: Center(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.green, fontSize: 17),
          ),
        ),
      ),
    );

Widget _buildview(BuildContext context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(275, 60),
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          // Get.to(Login());
        },
        child: Center(
          child: Text(
            'View ticket',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );

Widget _buildAlertDialog(BuildContext context) => Dialog(
      child: Container(
        height: 450,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/doneicon.png"),
              Text(
                "Payment Successful!",
                style: TextStyle(color: Colors.green, fontSize: 17),
              ),
              Text(
                "Successfully made payment and hotel booking",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              _buildview(context),
              _buildcancel(context)
            ],
          ),
        ),
      ),
    );
