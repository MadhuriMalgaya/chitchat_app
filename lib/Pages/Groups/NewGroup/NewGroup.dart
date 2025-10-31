import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chitchat/Controller/ContactController.dart';
import 'package:chitchat/Controller/GroupController.dart';
import 'package:chitchat/Pages/Groups/NewGroup/GroupTitle.dart';
import 'package:chitchat/Pages/Groups/NewGroup/SelectedMemberList.dart';
import 'package:chitchat/Pages/Home/Widget/ChatTile.dart';
import '../../../Config/Images.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        title: Text('New Group'),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor: groupController.groupMembers.isEmpty
              ? Colors.grey
              : Theme.of(context).colorScheme.primary,
          onPressed: () {
            if (groupController.groupMembers.isEmpty) {
              Get.snackbar("Error", "Please select atleast one member");
            } else {
              Get.to(GroupTitle());
            }
          },
          child: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            SelectedMembers(),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  "Contacts on ChitChat",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: StreamBuilder(
                stream: contactController.getContacts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text("No Messages"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            groupController.selectMember(snapshot.data![index]);
                          },
                          child: ChatTile(
                            imageUrl: snapshot.data![index].profileImage ??AssetsImage.defaultProfileUrl,
                            name: snapshot.data![index].name!,
                            lastChat: snapshot.data![index].about ?? "",
                            lastTime: "",
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
