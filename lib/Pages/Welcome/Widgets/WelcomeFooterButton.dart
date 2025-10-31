import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../../Config/Images.dart';
import '../../../Config/Strings.dart';

class WelcomeFooterbutton extends StatelessWidget {
  const WelcomeFooterbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        Get.offAllNamed("/homePage");
      },
      sliderButtonIcon: Container(
        width: 25.w,
        height: 25.h,
        child: SvgPicture.asset(
          AssetsImage.plugSVG,
          width: 25.w,
        ),
      ),
      text: WelcomePageString.slideToStart,
      textStyle: Theme.of(context).textTheme.labelLarge,
      submittedIcon: SvgPicture.asset(
        AssetsImage.connetSVG,
        width: 25.w,
      ),
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
