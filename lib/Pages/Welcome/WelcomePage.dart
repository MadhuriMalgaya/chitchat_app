import 'package:flutter/material.dart';
import 'package:chitchat/Pages/Welcome/Widgets/WelcomeBody.dart';
import 'package:chitchat/Pages/Welcome/Widgets/WelcomeFooterButton.dart';
import 'package:chitchat/Pages/Welcome/Widgets/WelcomeHeading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WelcomeHeading(),
              WelcomeBody(),
              WelcomeFooterbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
