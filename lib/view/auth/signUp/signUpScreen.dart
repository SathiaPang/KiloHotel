import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/auth/signIn/login.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:hotel/constant/constant.dart';

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
        centerTitle: false,
        title: const Text(
          'Fill your Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle:
                      TextStyle(color: black, fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
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
              _TextFieldPassword(),
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
        labelText: 'Full Name',
        labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _Username() => TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Nickname',
        labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _TextFieldsEmail() => TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey,
      onSaved: (email) {},
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));
  Widget _TextFieldPassword() => TextFormField(
        // controller: _controller.Rpassword,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: true,
        cursorColor: Colors.grey,
        onSaved: (password) {},
        decoration: InputDecoration(
          labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      );

  Widget _PhoneNumber() => IntlPhoneField(
        focusNode: _phoneNumberFocusNode,
        decoration: InputDecoration(
          labelText: 'Phone number',
          labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
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
        labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

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
}
