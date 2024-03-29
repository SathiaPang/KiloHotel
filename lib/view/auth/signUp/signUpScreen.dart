import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/register_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:hotel/constant/constant.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FocusNode _phoneNumberFocusNode = FocusNode();
  String? selectedGender;
  final RegisterController _registerController = Get.find();

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
              _Username(),
              SizedBox(height: 10),
              _Fullname(),
              SizedBox(height: 10),
              _address(),
              SizedBox(height: 10),
              _TextFieldsEmail(),
              SizedBox(height: 10),
              _TextFieldPassword(),
              SizedBox(height: 10),
              _PhoneNumber(),
              SizedBox(height: 10),
              SizedBox(height: 15),
              _signButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Username() => TextField(
      keyboardType: TextInputType.text,
      controller: _registerController.usernameController,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _Fullname() => TextField(
      keyboardType: TextInputType.text,
      controller: _registerController.nameController,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Fullname',
        labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _address() => TextField(
      keyboardType: TextInputType.text,
      controller: _registerController.addressController,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Address',
        labelStyle: TextStyle(color: black, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _TextFieldsEmail() => TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _registerController.emailController,
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
        controller: _registerController.passwordController,
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
        controller: _registerController.phoneController,
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

  Widget _signButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 65),
              backgroundColor: green,
            ),
            onPressed: () {
              _registerController.register();
            },
            child: Center(
              child: Text(
                'Create your new account here',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
          ),
        ],
      );
}
