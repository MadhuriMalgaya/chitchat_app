import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:chitchat/Controller/GroupController.dart';
import 'package:chitchat/Model/GroupModel.dart';
import '../../../Config/Images.dart';
import '../../../Controller/ImagePicker.dart';
import '../../../Widget/ImagePickerBottomSeet.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModel groupModel;
  const GroupTypeMessage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    GroupController groupController = Get.put(GroupController());
    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            child: SvgPicture.asset(
              AssetsImage.chatEmoji,
              width: 25.w,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(
                  filled: false, hintText: "Type message ..."),
            ),
          ),
          SizedBox(width: 10.w),
          Obx(
            () => groupController.selectedImagePath.value == ""
                ? InkWell(
                    onTap: () {
                      ImagePickerBottomSheet(
                          context,
                          groupController.selectedImagePath,
                          imagePickerController);
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      child: SvgPicture.asset(
                        AssetsImage.chatGallarySvg,
                        width: 25.w,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(width: 10.w),
          Obx(
            () => message.value != "" ||
                    groupController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      groupController.sendGroupMessage(
                        messageController.text,
                        groupModel.id!,
                        "",
                      );
                      messageController.clear();
                      message.value = "";
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      child: groupController.isLoading.value
                          ? CircularProgressIndicator()
                          : SvgPicture.asset(
                              AssetsImage.chatSendSvg,
                              width: 25.w,
                            ),
                    ),
                  )
                : Container(
                    width: 30.w,
                    height: 30.h,
                    child: SvgPicture.asset(
                      AssetsImage.chatMicSvg,
                      width: 25.w,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
