import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProfileButtomSheet extends StatelessWidget {
  const ProfileButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0.w, -3.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  CustomText(text: 'Edit Profile', color: Colors.white),
                  Gap(5.w),
                  Icon(CupertinoIcons.pencil, color: Colors.white),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.primary),
              ),
              child: Row(
                children: [
                  CustomText(text: 'Logout', color: AppColors.primary),
                  Gap(5.w),
                  Icon(Icons.logout_rounded, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
