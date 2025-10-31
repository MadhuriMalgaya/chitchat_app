import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:chitchat/Controller/ChatController.dart';
import 'package:chitchat/Model/UserModel.dart';
import '../../../Config/Images.dart';
import '../../../Controller/ImagePicker.dart';
import '../../../Widget/ImagePickerBottomSeet.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;
  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 15.h),
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
                print("typing...");
                if (value.isNotEmpty) {
                  print("typing...");
                } else {
                  print("not typing");
                }
              },
              onEditingComplete: () {
                print("onEditingComplete");
              },
              controller: messageController,
              decoration: const InputDecoration(
                  filled: false, hintText: "Type message ..."),
            ),
          ),
          SizedBox(width: 10.w),
          Obx(
            () => chatController.selectedImagePath.value == ""
                ? InkWell(
                    onTap: () {
                      ImagePickerBottomSheet(
                          context,
                          chatController.selectedImagePath,
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
                    chatController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (messageController.text.isNotEmpty ||
                          chatController.selectedImagePath.value.isNotEmpty) {
                        chatController.sendMessage(
                            userModel.id!, messageController.text, userModel);
                        messageController.clear();
                        message.value = "";
                      }
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      child: chatController.isLoading.value
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
