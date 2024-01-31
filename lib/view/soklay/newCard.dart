import 'package:flutter/material.dart';

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
    );
  }
}
