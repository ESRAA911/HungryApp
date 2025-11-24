import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  final String image, text, desc, rate;
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.network(image, height: 110.h, width: 130.w)),
              Gap(5.h),
              CustomText(text: text, weight: FontWeight.bold,color:  Color(0xff3C2F2F),),
              CustomText(text: desc,color:  Color(0xff3C2F2F),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: '⭐ $rate'),
                  Gap(40.w),
                  Icon(CupertinoIcons.heart_fill, color: AppColors.primary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
