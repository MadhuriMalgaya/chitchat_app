import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chitchat/Config/Images.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isComming,
      required this.time,
      required this.status,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
              padding: EdgeInsets.all(10.r),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 1.3,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: isComming
                    ?  BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        topRight: Radius.circular(10.w),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(10.h),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        topRight: Radius.circular(10.w),
                        bottomLeft: Radius.circular(10.h),
                        bottomRight: Radius.circular(0),
                      ),
              ),
              child: imageUrl == ""
                  ? Text(message)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        message == "" ? Container() : SizedBox(height: 10.h),
                        message == "" ? Container() : Text(message),
                      ],
                    )),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : Row(
                      children: [
                        Text(
                          time,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                     SizedBox(width: 10.w),
                        SvgPicture.asset(
                          AssetsImage.chatStatusSvg,
                          color: status == "read" ? Colors.green : Colors.grey,
                          width: 20.w,
                        )
                      ],
                    ),
            ],
          )
        ],
      ),
    );
  }
}
