import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Config/Images.dart';
import '../../../Config/Strings.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetsImage.appIconPNG,
          height: 60.h,
          width: 60.w,

        ),
        SizedBox(height: 20),
        Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(),
        ),
      ],
    );
  }
}
