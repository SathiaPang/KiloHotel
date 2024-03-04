import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel/constant/constant.dart';

import 'package:hotel/view/auth/signUp/signUpScreen.dart';

class CreateAcc extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final bool initialValue;
  CreateAcc({super.key, this.onChanged, this.initialValue = false});

  @override
  State<CreateAcc> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<CreateAcc> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Create your\nAccount ",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
              _TextFieldsEmail(),
              _TextFieldsPassword(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked ?? false,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
              SizedBox(height: 5),
              _signupButton(),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: Get.width / 5,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text('or continue with', style: TextStyle(fontSize: 17)),
                  SizedBox(width: 5),
                  Container(
                    height: 1,
                    width: Get.width / 5,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Box(image: 'assets/images/facebook.png'),
                  _Box(image: 'assets/images/google.png'),
                  _Box(image: 'assets/images/apple.png'),
                ],
              ),
              _buildDontHaveAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _TextFieldsEmail() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: Colors.grey,
          // controller:
          onSaved: (email) {},
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      );

  Widget _TextFieldsPassword() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextFormField(
          // controller: _controller.Lpassword,
          textInputAction: TextInputAction.done,
          obscureText: true,
          cursorColor: Colors.grey,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Icon(Icons.lock),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      );
  Widget _signupButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 65),
              backgroundColor: green,
            ),
            onPressed: () {
              Get.to(SignupScreen());
            },
            child: Center(
              child: Text(
                'Sign up',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
          ),
        ],
      );
  Widget _Box({required String image}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black38,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Image.asset(
              image,
            ),
          ),
        ),
      );
  Widget _buildDontHaveAccount(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? "),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
}
