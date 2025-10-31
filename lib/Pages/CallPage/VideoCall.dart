import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chitchat/Config/Strings.dart';
import 'package:chitchat/Controller/ChatController.dart';
import 'package:chitchat/Controller/ProfileController.dart';
import 'package:chitchat/Model/UserModel.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallPage extends StatelessWidget {
  final UserModel target;
  const VideoCallPage({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    var callId = chatController.getRoomId(target.id!);
    return ZegoUIKitPrebuiltCall(
      appID: zegoCloudConfig.appId,
      appSign: zegoCloudConfig.appSign,
      userID: profileController.currentUser.value.id ?? "root",
      userName: profileController.currentUser.value.name ?? "root",
      callID: callId,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}


// 123

