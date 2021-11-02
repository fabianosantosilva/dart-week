import 'package:dartweek/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/background.png",
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black45,
            // color: Colors.black.opacity(45),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: Get.width * .9,
                height: 42,
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () => controller.login(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  text: "Login com google",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}