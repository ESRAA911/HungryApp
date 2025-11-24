import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SpicySlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final String image;
  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(image, height: 220.h, width: 180.w),
        Column(
          children: [
            CustomText(
              text:
                  'Customize Your Burger\n to Your Tastes. Ultimate\n Experience',
              color: Color(0xff3C2F2F),
            ),
            Slider(
              value: value,
              onChanged: onChanged,
              inactiveColor: Colors.grey.shade300,
              activeColor: AppColors.primary,
              min: 0,
              max: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: '🥶'),
                Gap(115),
                CustomText(text: '🌶️'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
