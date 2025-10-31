import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chitchat/Controller/AuthController.dart';
import 'package:chitchat/Pages/Auth/ForgotPassword.dart';
import 'package:chitchat/Widget/PrimaryButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        SizedBox(height: 40.h),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
            prefixIcon: Icon(
              Icons.alternate_email_rounded, color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        TextField(
          controller: password,
          decoration:  InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
            prefixIcon: Icon(
              Icons.password_outlined,color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.to(ForgotPassword());
              },
              child: Text("Forgot Password ? ",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            )
          ],
        ),
       SizedBox(height: 60.h),
        Obx(
          () => authController.isLoading.value
              ? CircularProgressIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      ontap: () {
                        authController.login(
                          email.text,
                          password.text,
                        );
                      },
                      btnName: "LOGIN",
                      icon: Icons.lock_open_outlined,
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
