import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chitchat/Config/Images.dart';
import 'package:chitchat/Controller/AppController.dart';
import 'package:chitchat/Controller/ContactController.dart';
import 'package:chitchat/Controller/ImagePicker.dart';
import 'package:chitchat/Controller/StatusController.dart';
import 'package:chitchat/Pages/CallHistory/CallHistory.dart';
import 'package:chitchat/Pages/Groups/GroupsPage.dart';
import 'package:chitchat/Pages/Home/Widget/ChatsList.dart';
import 'package:chitchat/Pages/Home/Widget/TabBar.dart';
import 'package:chitchat/Pages/ProfilePage/ProfilePage.dart';


import '../../Config/Strings.dart';
import '../../Controller/CallController.dart';
import '../../Controller/ProfileController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ContactController contactController = Get.put(ContactController());
    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    StatusController statusController = Get.put(StatusController());
    CallController callController = Get.put(CallController());
    AppController appController = Get.put(AppController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.r),
          child: Image.asset(
            AssetsImage.appIconPNG,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //appController.checkLatestVersion();
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () async {
              await profileController.getUserDetails();
              Get.to(ProfilePage());
            },
            icon: Icon(
              Icons.more_vert,
            ),
          )
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),
            GroupPage(),
            CallHistory(),
          ],
        ),
      ),
    );
  }
}
