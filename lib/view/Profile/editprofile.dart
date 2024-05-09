import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/updateProfile_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:hotel/constant/constant.dart';

class EditPF extends StatefulWidget {
  EditPF({super.key});

  @override
  State<EditPF> createState() => _EditPFState();
}

class _EditPFState extends State<EditPF> {
  FocusNode _phoneNumberFocusNode = FocusNode();
  String? selectedGender;

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  final UpdateProfileController _updateProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Edit Profile',
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
              _Address(),
              SizedBox(height: 10),
              _TextFieldsEmail(),
              SizedBox(height: 10),
              _PhoneNumber(),
              SizedBox(height: 10),
              // _Gender(),
              _signButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Fullname() => TextField(
      controller: _updateProfileController.nameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: 'name'.tr,
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _Username() => TextField(
      controller: _updateProfileController.usernameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'userName'.tr,
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));
  Widget _Address() => TextField(
      controller: _updateProfileController.addressController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'address'.tr,
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _TextFieldsEmail() => TextFormField(
      controller: _updateProfileController.emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.grey,
      onSaved: (email) {},
      decoration: InputDecoration(
        labelText: 'email'.tr,
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ));

  Widget _PhoneNumber() => IntlPhoneField(
        controller: _updateProfileController.phoneController,
        focusNode: _phoneNumberFocusNode,
        decoration: InputDecoration(
          labelText: 'phone'.tr,
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
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

  Widget _signButton() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            _updateProfileController.updateProfile();
          },
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: green,
            foregroundColor: white,
            shadowColor: black,
            minimumSize: Size(410, 65),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            'update'.tr,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ),
      );
}
