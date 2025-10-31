import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Controller/ChatController.dart';
import '../Controller/ImagePicker.dart';

Future<dynamic> ImagePickerBottomSheet(BuildContext context, RxString imagePath,
    ImagePickerController imagePickerController) {
  return Get.bottomSheet(Container(
    height: 150.h,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius:  BorderRadius.only(
        topLeft: Radius.circular(10.w),
        topRight: Radius.circular(10.w),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () async {
            imagePath.value =
                await imagePickerController.pickImage(ImageSource.camera);
            Get.back();
          },
          child: Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15),
            ),
            child:  Icon(
              Icons.camera,
              size: 30.h,
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            imagePath.value =
                await imagePickerController.pickImage(ImageSource.gallery);
            Get.back();
          },
          child: Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(
              Icons.photo,
              size: 30.h,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.play_arrow,
              size: 30.h,
            ),
          ),
        )
      ],
    ),
  ));
}
