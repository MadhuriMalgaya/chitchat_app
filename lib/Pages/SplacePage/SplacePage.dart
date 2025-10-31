import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chitchat/Config/Images.dart';
import 'package:chitchat/Controller/SplaceController.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetsImage.appIconPNG,
              width: 120.w,
              height: 120.w,
        )
      ),
    );
  }
}
