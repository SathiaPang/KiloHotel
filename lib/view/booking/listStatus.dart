import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/constant.dart';

import 'package:hotel/model/getCurrentUserBooking.dart';

class ListStatus extends StatelessWidget {
  ListStatus({
    super.key,
    required this.listData,
    required this.onPressed,
  });

  final List<DataBooking> listData;
  final Function(DataBooking num) onPressed;

  @override
  Widget build(BuildContext context) => Obx(() => listData.isEmpty
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.article_outlined,
              color: black.withOpacity(0.3),
              size: 100,
            ),
            Text(
              "No data",
              style: TextStyle(
                fontSize: 25,
                color: black.withOpacity(0.3),
              ),
            )
          ],
        )
      : Container(
          child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final bookingDATA = listData[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: white,
                      border: Border.all(
                          width: 2,
                          color:
                              bookingDATA.status == "CONFIRMED" ? green : red)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // image: DecorationImage(
                                //     image: NetworkImage(
                                //       "${bookingDATA.bookingDetail..isEmpty ? "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg" : bookingDATA.image.first.url}",
                                //     ),
                                //     fit: BoxFit.fitHeight),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://media.designcafe.com/wp-content/uploads/2023/07/05141750/aesthetic-room-decor.jpg"),
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${bookingDATA.id}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'In :',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${bookingDATA.checkInAt}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Out :',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "\t${bookingDATA.checkOutAt}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: bookingDATA.status == "CONFIRMED"
                                            ? greenAccent
                                            : redAccent),
                                    child: Text(
                                      '${bookingDATA.status}',
                                      style: TextStyle(
                                          color:
                                              bookingDATA.status == "CONFIRMED"
                                                  ? green
                                                  : red),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        bookingDATA.status == "CONFIRMED"
                            ? Container(
                                height: 2,
                                width: double.infinity,
                                color: green,
                              )
                            : SizedBox(),
                        bookingDATA.status == "CONFIRMED"
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("If you want to cancel please tap"),
                                  TextButton(
                                      onPressed: () =>
                                          onPressed(listData[index]),
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: green,
                                            fontSize: 18,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationStyle:
                                                TextDecorationStyle.double,
                                            decorationColor: green),
                                      ))
                                ],
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
}
