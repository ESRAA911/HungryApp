import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/cart/widgets/cart_body.dart';
import 'package:hungry_app/features/cart/widgets/cart_bottom_sheet.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: CartBody(),
      bottomSheet: CartBottomSheet()
    );
  }
}
