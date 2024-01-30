import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/auth/signIn/login.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../constant.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _date = TextEditingController();
  FocusNode _phoneNumberFocusNode = FocusNode();
  String? selectedGender;

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fill your Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              _Fullname(),
              SizedBox(height: 10),
              _Username(),
              SizedBox(height: 10),
              TextField(
                controller: _date,
                decoration: buildInputDecoration(
                    "Date of Birth", Icons.calendar_month_outlined),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickeddate != null) {
                    setState(() {
                      _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },
              ),
              SizedBox(height: 10),
              _TextFieldsEmail(),
              SizedBox(height: 10),
              _PhoneNumber(),
              SizedBox(height: 10),
              _Gender(),
              SizedBox(height: 15),
              _signButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Fullname() => TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: textfieldcolor,
        labelText: 'Full Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _Username() => TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.grey,
        decoration: buildInputDecoration("Nickname", Icons.person),
      );

  Widget _TextFieldsEmail() => TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.grey,
        onSaved: (email) {},
        decoration: const InputDecoration(
          hintText: "Email",
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      );

  Widget _PhoneNumber() => IntlPhoneField(
        focusNode: _phoneNumberFocusNode,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        languageCode: "en",
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          print('Country changed to: ' + country.name);
        },
      );

  Widget _Gender() => DropdownButtonFormField<String>(
        value: selectedGender,
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue;
          });
        },
        items: <String>['Male', 'Female']
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      );

  Widget _signButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 65),
              backgroundColor: green,
            ),
            onPressed: () {
              Get.to(Login());
            },
            child: Center(
              child: Text(
                'Sign in with password',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
          ),
        ],
      );

  InputDecoration buildInputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
