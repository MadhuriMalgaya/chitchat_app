import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewContactTile extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback ontap;
  const NewContactTile(
      {super.key,
      required this.btnName,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              child: Icon(
                icon,
                size: 30.r,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 20.w),
            Text(
              btnName,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
