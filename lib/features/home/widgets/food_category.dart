import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class FoodCategory extends StatefulWidget {
  
  const FoodCategory({super.key, required this.selectedIndex, required this.category, required this.onCategorySelected});
   final int selectedIndex;
  final List category;
  final Function(int) onCategorySelected;
  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap:()=>widget.onCategorySelected(index),
            child: Container(
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                color: widget.selectedIndex == index
                    ? AppColors.primary
                    : Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 5.h),
              child: CustomText(
                text: widget.category[index],
                weight: FontWeight.w500,
                color: widget.selectedIndex == index
                    ? Colors.white
                    : Colors.grey.shade700,
              ),
            ),
          );
        }),
      ),
    );
  }
}
