import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Config/Images.dart';
import '../../../Config/Strings.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(AssetsImage.boyPic,
                width: 70.w,   // responsive width
                height: 70.h,  // responsive height
                fit: BoxFit.cover,),
            ),
            SvgPicture.asset(AssetsImage.connetSVG),
            ClipOval(
              child: Image.asset(AssetsImage.girlPic,
                width: 70.w,   // responsive width
                height: 70.h,  // responsive height
                fit: BoxFit.cover,),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Text(
          WelcomePageString.nowYourAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomePageString.connected,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 30.h),
        Text(
          WelcomePageString.discription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }
}
