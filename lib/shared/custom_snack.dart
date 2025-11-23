import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

SnackBar customSnack(errorMsg, color) {
  return SnackBar(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    margin: EdgeInsets.only(bottom: 30.h, right: 20.w, left: 20.w),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    clipBehavior: Clip.none,
    backgroundColor: color,
    content: SingleChildScrollView(
      child: Row(
        children: [
          Icon(CupertinoIcons.info, color: Colors.white),
          Gap(5.w),
          CustomText(
            text: errorMsg,
            color: Colors.white,
            size: 13.sp,
            weight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}
