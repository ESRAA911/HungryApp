import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/home/data/product_model.dart';
import 'package:hungry_app/features/product/views/product_details_view.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';


class CustomSliverPadding extends StatelessWidget {
  final List<ProductModel>?products;
  const CustomSliverPadding({super.key,this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: products?.length,
             (context, index) {
              final product=products![index];
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
                image: product.image,
                text: product.name,
                desc: product.desc,
                rate: product.rating,
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