import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/controller/name_of_reservation_controller.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:hotel/constant/constant.dart';

class NameOfReserver extends StatefulWidget {
  NameOfReserver({super.key});

  @override
  State<NameOfReserver> createState() => _NameOfReserverState();
}

class _NameOfReserverState extends State<NameOfReserver> {
  FocusNode _phoneNumberFocusNode = FocusNode();
  final selectColor = ''.obs;
  final selectedGender = ''.obs;
  final NameOfReservationController _nameOfReservationController = Get.find();
  final list = Get.arguments;

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Name of Reservation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: _buildBottonContinue(),
      body: Column(
        children: [
          //
          _buildFullName(),
          _buildNickName(),
          _buildDOB(),
          _buildGmail(),
          _PhoneNumber(),
          _subTiTle(),
          _builIcon()
        ],
      ),
    );
  }

  Widget _buildBottonContinue() => InkWell(
        onTap: () {
          _nameOfReservationController.saveNameReservation(list);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(
            height: Get.height / 15,
            width: Get.width / 1.1,
            decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: textColor,
                    offset: Offset(1, 6),
                    blurRadius: 7,
                  ),
                ]),
            child: Center(
              child: Text(
                "Continue",
                style: TextStyle(
                    color: white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );

  Widget _buildFullName() => Padding(
        padding: const EdgeInsets.all(12),
        child: TextFormField(
          controller: _nameOfReservationController.fullName,
          decoration: InputDecoration(
              filled: true,
              fillColor: textfieldcolor,
              labelText: "Full Name",
              labelStyle: TextStyle(color: black, fontWeight: FontWeight.w400),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      );

  Widget _buildNickName() => Padding(
        padding: const EdgeInsets.all(12),
        child: TextFormField(
          controller: _nameOfReservationController.nickName,
          decoration: InputDecoration(
              filled: true,
              fillColor: textfieldcolor,
              labelText: "Nickname",
              labelStyle: TextStyle(color: black, fontWeight: FontWeight.w400),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      );

  Widget _buildDOB() => Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: _nameOfReservationController.dateOfBirth,
          onTap: () async {
            DateTime? pickeddate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );

            if (pickeddate != null) {
              _nameOfReservationController.dateOfBirth.text =
                  DateFormat('yyyy-MM-dd').format(pickeddate);
            }
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: textfieldcolor,
              hintText: "Date of Birth",
              suffixIcon: Icon(Icons.calendar_month_outlined),
              labelStyle: TextStyle(color: black, fontWeight: FontWeight.w400),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      );

  Widget _buildGmail() => Padding(
        padding: const EdgeInsets.all(12),
        child: TextFormField(
          controller: _nameOfReservationController.email,
          decoration: InputDecoration(
              filled: true,
              fillColor: textfieldcolor,
              suffixIcon: Icon(Icons.email_outlined),
              labelText: "Email",
              labelStyle: TextStyle(color: black, fontWeight: FontWeight.w400),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      );

  Widget _PhoneNumber() => Padding(
        padding: const EdgeInsets.all(12),
        child: IntlPhoneField(
          controller: _nameOfReservationController.phoneNumber,
          focusNode: _phoneNumberFocusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: textfieldcolor,
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          languageCode: "en",
          onChanged: (phone) {
            print(phone.completeNumber);
          },
          onCountryChanged: (country) {
            print('Country changed to: ' + country.name);
          },
        ),
      );

  Widget _subTiTle() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Center(
          child: Text(
            "Name Reservation is a process by which you reserve a name for your future business. The first step to your future business is to apply for Name Reservation.",
            style: TextStyle(
                color: textColor, fontSize: 15, fontWeight: FontWeight.w300),
          ),
        ),
      );

  Widget _builIcon() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.facebook,
            color: Colors.blue,
          ),
          Icon(
            Icons.public,
            color: green,
          ),
          Icon(
            Icons.email,
            color: Color.fromARGB(255, 125, 10, 1),
          )
        ],
      );
}
