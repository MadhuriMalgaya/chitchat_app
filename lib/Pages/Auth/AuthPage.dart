import 'package:flutter/material.dart';
import 'package:chitchat/Pages/Auth/Widgets/AuthPageBody.dart';
import 'package:chitchat/Pages/Welcome/Widgets/WelcomeHeading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeHeading(),
                SizedBox(height: 60.h),
                AuthPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
