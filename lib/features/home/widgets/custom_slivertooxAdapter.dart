import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/widgets/food_category.dart';
import 'package:hungry_app/features/home/widgets/search_field.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';

class CustomSlivertooxadapter extends StatefulWidget {
  const CustomSlivertooxadapter({super.key});

  @override
  State<CustomSlivertooxadapter> createState() => _CustomSlivertooxadapterState();
}

class _CustomSlivertooxadapterState extends State<CustomSlivertooxadapter> {
   List categories = ['All', 'Combos', 'Sliders', 'Classic'];
   int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Gap(40.h),
                    UserHeader(),
                    Gap(15.h),
                    SearchField(),
                    Gap(25.h),
                    FoodCategory(
                      selectedIndex: selectedIndex,
                      category: categories,
                       onCategorySelected: (index ) {
                        setState(() {
                          selectedIndex=index;
                        });
                        },
                    ),
                    Gap(10.h)
                  ],
                ),
              ),
            );
          
  }
}