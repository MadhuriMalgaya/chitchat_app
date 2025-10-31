import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chitchat/Controller/AuthController.dart';
import 'package:chitchat/Widget/PrimaryButton.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 40),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Full Name",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
            prefixIcon: Icon(
              Icons.person, color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
            hintText: "Email",
            prefixIcon: Icon(
              Icons.alternate_email_rounded,color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
            prefixIcon: Icon(
              Icons.password_outlined, color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 60),
        Obx(
          () => authController.isLoading.value
              ? CircularProgressIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      ontap: () {
                        authController.createUser(
                          email.text,
                          password.text,
                          name.text,
                        );
                      },
                      btnName: "SIGNUP",
                      icon: Icons.lock_open_outlined,
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
