import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/constant/appRoute.dart';
import 'package:hotel/language/language.dart';

class Setting extends StatelessWidget {
  Setting({super.key});
  final LanguageChange _languageChange = Get.find();

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text("choose".tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          print(_languageChange.language[index]['name']);
                          _languageChange.updateLanguage(
                              _languageChange.language[index]['locale']);
                        },
                        child: Text(_languageChange.language[index]['name']));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.amber,
                    );
                  },
                  itemCount: _languageChange.language.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "seetingTitle".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [_editPF(), _password(), _language(context)],
      ),
    );
  }

  Widget _editPF() => Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.editPF);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "editPF".tr,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _password() => Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.changePassword);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: Get.height / 25,
                width: Get.width / 2,
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "password".tr,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _language(BuildContext context) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              height: Get.height / 25,
              child: Row(
                children: [
                  Icon(Icons.language),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "change".tr,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          TextButton(
              onPressed: () {
                buildDialog(context);
              },
              child: Text("Language"))
        ],
      );
}
