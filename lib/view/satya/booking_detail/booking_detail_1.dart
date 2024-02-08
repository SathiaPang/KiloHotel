import 'package:flutter/material.dart';
import 'package:hotel/constant.dart';

class BookDetailScreenOne extends StatefulWidget {
  const BookDetailScreenOne({super.key});

  @override
  State<BookDetailScreenOne> createState() => _BookDetailScreenOneState();
}

class _BookDetailScreenOneState extends State<BookDetailScreenOne> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 1,
            height: size.height * 0.35,
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      print("ohh you touch me tal la la");
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/hotel.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0),
            child: Text(
              "Presidential Hotel",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                children: <InlineSpan>[
                  WidgetSpan(child: Icon(Icons.location_history))
                ]),
          ),
        ],
      ),
    );
  }
}
