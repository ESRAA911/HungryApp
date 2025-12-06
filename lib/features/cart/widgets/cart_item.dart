import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  final String image, title, spicy;
  final int num,toppingsCount,optionsCount;
  final List<String> toppingImages;
  final List<String> optionImages;
  final Function()? onAdd;
  final Function()? onMin;
  final Function()? onRemove;
  final bool isLoading;
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.spicy,
    this.onAdd,
    this.onMin,
    this.onRemove,
    required this.num,
    required this.toppingsCount,
    required this.optionsCount,
    required this.toppingImages,
    required this.optionImages,
     required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(image, width: 100.w, height: 100.h),
                    CustomText(
                      text: title,
                      size: 14.sp,
                      weight: FontWeight.w600,
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
                            radius: 15.r,
                            child: Icon(
                              CupertinoIcons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Gap(10.w),
                        CustomText(
                          text: num.toString(),
                          size: 18,
                          weight: FontWeight.w500,
                          color: Color(0xff3C2F2F),
                        ),
                        Gap(10.w),
                        GestureDetector(
                          onTap: onMin,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            radius: 15.r,
                            child: Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(15.h),
                    GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        width: 95.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: isLoading?CupertinoActivityIndicator(color: Colors.white,):
                         Center(
                          child: CustomText(
                            text: 'Remove',
                            color: Colors.white,
                            size: 16.sp,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CustomText(
                  text: 'SPICY: $spicy',
                  size: 13.sp,
                  weight: FontWeight.w600,
                  color: Color(0xff3C2F2F),
                ),
              ],
            ),

            Row(
              children: [
                CustomText(
                  text: 'TOPPINGS: ',
                  size: 13.sp,
                  weight: FontWeight.w600,
                  color: Color(0xff3C2F2F),
                ),

                Expanded(
                  child: SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: toppingsCount,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundImage: NetworkImage(toppingImages[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CustomText(
                  text: 'SIDE OPTIONS: ',
                  size: 13.sp,
                  weight: FontWeight.w600,
                  color: Color(0xff3C2F2F),
                ),
                Expanded(
                  child: SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: optionsCount,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundImage: NetworkImage(optionImages[index]),
                          ),
                        );
                      },
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
