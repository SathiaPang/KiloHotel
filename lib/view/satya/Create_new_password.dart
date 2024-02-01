import 'package:flutter/material.dart';
import 'package:hotel/constant.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // This is using navigate back
              },
            ),
            Text("Create New Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ],
        ),
        automaticallyImplyLeading: false, // Disable the default back button
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.45,
              color: green.withOpacity(0.1),
            ),
            Text(
              "Create Your New Password",
              style: TextStyle(color: textColor, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.password,
                    color: textColor,
                  ),
                  onPressed: () {
                    print('Search');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "New Password",
                prefixIcon: IconButton(
                  icon: const Icon(Icons.pin_sharp),
                  onPressed: () {
                    print('Search');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckMeBox(),
                Text("Remember Me"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckMeBox extends StatefulWidget {
  const CheckMeBox({super.key});

  @override
  State<CheckMeBox> createState() => _CheckMeBoxState();
}

class _CheckMeBoxState extends State<CheckMeBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: green,
      onChanged: (newBool) {
        setState(() {
          //isChecked = newBool;
        });
      },
    );
  }
}
