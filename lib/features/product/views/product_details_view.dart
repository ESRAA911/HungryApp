import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/data/models/topping_model.dart';
import 'package:hungry_app/features/home/data/repo/product_repo.dart';
import 'package:hungry_app/features/product/widgets/product_details_bottom_sheet.dart';
import 'package:hungry_app/features/product/widgets/spicy_slider.dart';
import 'package:hungry_app/features/product/widgets/topping_card.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsView extends StatefulWidget {
  final String prodImage;
  const ProductDetailsView({super.key, required this.prodImage});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double _value = 0.5;
  ProductRepo productRepo = ProductRepo();
  List<ToppingModel>? toppings;
  List<ToppingModel>? options;
  Future<void> getToppings() async {
    try {
      final response = await productRepo.getToppings();
      setState(() {
        toppings = response;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getSideOptions() async {
    try {
      final response = await productRepo.getSideOptions();
      setState(() {
        options = response;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getToppings();
    getSideOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: toppings == null && options == null,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(
                value: _value,
                onChanged: (v) {
                  setState(() {
                    _value = v;
                  });
                },
                image: widget.prodImage,
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CustomText(
                  text: 'Toppings',
                  size: 20.sp,
                  color: Color(0xff3C2F2F),
                  weight: FontWeight.w600,
                ),
              ),
              Gap(10.h),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(toppings?.length ?? 6, (index) {
                    final tooping = toppings?[index];
                    if (tooping == null) return CupertinoActivityIndicator();
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: ToppingCard(
                        image: tooping.image,
                        title: tooping.name,
                        onTap: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CustomText(
                  text: 'Side options',
                  size: 20.sp,
                  color: Color(0xff3C2F2F),
                  weight: FontWeight.w600,
                ),
              ),
              Gap(10.h),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(options?.length ?? 6, (index) {
                    final option = options?[index];
                    if (option == null) return CupertinoActivityIndicator();
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: ToppingCard(
                        image: option!.image,
                        title: option.name,
                        onTap: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(160.h),
            ],
          ),
        ),
        bottomSheet: ProductDetailsBottomSheet(),
      ),
    );
  }
}
