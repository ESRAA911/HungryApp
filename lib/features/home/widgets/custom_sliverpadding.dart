import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/product/views/product_details_view.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';

class CustomSliverpadding extends StatefulWidget {
  const CustomSliverpadding({super.key});

  @override
  State<CustomSliverpadding> createState() => _CustomSliverpaddingState();
}

class _CustomSliverpaddingState extends State<CustomSliverpadding> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: 6, (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailsView();
                  },
                ),
              );
            },
            child: CardItem(
              image: 'assets/test/burger.png',
              text: 'Cheeseburger',
              desc: "Wendy's Burger",
              rate: '4.9',
            ),
          );
        }),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
        ),
      ),
    );
  }
}
