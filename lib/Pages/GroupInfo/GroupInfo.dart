import 'package:flutter/material.dart';
import 'package:chitchat/Config/Images.dart';
import 'package:chitchat/Model/GroupModel.dart';
import 'package:chitchat/Pages/Home/Widget/ChatTile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'GroupMemberInfo.dart';

class GroupInfo extends StatelessWidget {
  final GroupModel groupModel;
  const GroupInfo({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupModel.name!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.h),
        child: ListView(
          children: [
            GroupMemberInfo(
              groupId: groupModel.id!,
              profileImage: groupModel.profileUrl == ""
                  ? AssetsImage.defaultProfileUrl
                  : groupModel.profileUrl!,
              userName: groupModel.name!,
              userEmail: groupModel.description ?? "No Description Available",
            ),
            SizedBox(height: 20.h),
            Text(
              "Members",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            Column(
              children: groupModel.members!
                  .map(
                    (member) => ChatTile(
                      imageUrl:
                          member.profileImage ?? AssetsImage.defaultProfileUrl,
                      name: member.name!,
                      lastChat: member.email!,
                      lastTime: member.role == "admin" ? "Admin" : "User",
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
