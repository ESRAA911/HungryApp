import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 190.h),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 15.r,
                offset: Offset(0.w, 0.h),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundColor: AppColors.primary,
                child: Icon(
                  CupertinoIcons.check_mark,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
              CustomText(
                text: 'Success!',
                color: AppColors.primary,
                size: 30.sp,
                weight: FontWeight.bold,
              ),
              Gap(15.h),
              CustomText(
                text:
                    'Your payment was successful.\nA receipt for this purchase has\nbeen sent to your email.',
                color: Color(0xffBCBBBB),
                size: 14.sp,
                weight: FontWeight.w400,
              ),
              Gap(25.h),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Root()),
                  );
                },
                text: 'Go Back',
                height: 60.h,
                width: 220.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
