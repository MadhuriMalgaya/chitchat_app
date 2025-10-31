import 'package:flutter/material.dart';
import 'package:chitchat/Widget/PrimaryButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                    children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: 200.w,
                        height: 200.h,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 40.h,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(
                            100.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Personal Info",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Email id",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Example@gmail.com",
                          prefixIcon: Icon(
                            Icons.alternate_email_rounded,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Phone Number",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "0237647324",
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButton(
                            btnName: "Save",
                            icon: Icons.save,
                            ontap: () {},
                          ),
                        ],
                      )
                    ],
                  ))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
