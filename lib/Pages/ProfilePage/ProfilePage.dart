import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chitchat/Controller/AuthController.dart';
import 'package:chitchat/Controller/ImagePicker.dart';
import 'package:chitchat/Controller/ProfileController.dart';
import 'package:chitchat/Widget/PrimaryButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController name =
        TextEditingController(text: profileController.currentUser.value.name);
    TextEditingController email =
        TextEditingController(text: profileController.currentUser.value.email);
    TextEditingController phone = TextEditingController(
        text: profileController.currentUser.value.phoneNumber);
    TextEditingController about =
        TextEditingController(text: profileController.currentUser.value.about);
    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    RxString imagePath = "".obs;

    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logoutUser();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.r),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              // height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isEdit.value
                                  ? InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        imagePath.value =
                                            await imagePickerController
                                                .pickImage(ImageSource.gallery);
                                        print("Image Picked" + imagePath.value);
                                      },
                                      child: Container(
                                        height: 200.h,
                                        width: 200.w,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                        ),
                                        child: imagePath.value == ""
                                            ? Icon(
                                                Icons.add,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100.r),
                                                child: Image.file(
                                                  File(imagePath.value),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                      ),
                                    )
                                  : Container(
                                      height: 200.h,
                                      width: 200.w,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                      ),
                                      child: profileController.currentUser.value.profileImage == null || profileController.currentUser.value.profileImage == ""
                                          ? Icon(
                                              Icons.image,
                                            )
                                          : ClipRRect(
                                              borderRadius: BorderRadius.circular(100.r),
                                              child: CachedNetworkImage(
                                                imageUrl: profileController
                                                    .currentUser
                                                    .value
                                                    .profileImage!,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              )),
                                    ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Obx(
                          () => TextField(
                            controller: name,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Name",
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Obx(
                          () => TextField(
                            controller: about,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "About",
                              prefixIcon: Icon(
                                Icons.info,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          controller: email,
                          enabled: false,
                          decoration: InputDecoration(
                            filled: isEdit.value,
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.alternate_email,
                            ),
                          ),
                        ),
                        Obx(
                          () => TextField(
                            controller: phone,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              filled: isEdit.value,
                              labelText: "Number",
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isEdit.value
                                  ? PrimaryButton(
                                      btnName: "Save",
                                      icon: Icons.save,
                                      ontap: () async {
                                        await profileController.updateProfile(
                                          imagePath.value,
                                          name.text,
                                          about.text,
                                          phone.text,
                                        );
                                        isEdit.value = false;
                                      },
                                    )
                                  : PrimaryButton(
                                      btnName: "Edit",
                                      icon: Icons.edit,
                                      ontap: () {
                                        isEdit.value = true;
                                      },
                                    ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
