import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  final String image, title, desc;
  final int num;
  final Function()? onAdd;
  final Function()? onMin;
  final Function()? onRemove;
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.onAdd,
    this.onMin,
    this.onRemove,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(image, width: 105.w, height: 100.h),
                CustomText(
                  text: title,
                  size: 16.sp,
                  weight: FontWeight.w600,
                  color: Color(0xff3C2F2F),
                ),
                CustomText(
                  text: desc,
                  size: 14.sp,
                  weight: FontWeight.w400,
                  color: Color(0xff3C2F2F),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onAdd,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 17.r,
                        child: Icon(CupertinoIcons.add, color: Colors.white),
                      ),
                    ),
                    Gap(20.w),
                    CustomText(
                      text: num.toString(),
                      size: 18,
                      weight: FontWeight.w500,
                      color: Color(0xff3C2F2F),
                    ),
                    Gap(20.w),
                    GestureDetector(
                      onTap: onMin,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 17.r,
                        child: Icon(CupertinoIcons.minus, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    width: 130.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Remove',
                        color: Colors.white,
                        size: 18.sp,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
