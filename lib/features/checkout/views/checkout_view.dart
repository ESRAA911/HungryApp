import 'package:flutter/material.dart';
import 'package:hungry_app/features/checkout/widgets/checkout_body.dart';
import 'package:hungry_app/features/checkout/widgets/checkout_bottom_sheet.dart';


class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedItem = 'Cash';
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body:CheckoutBody(),
      bottomSheet: CheckoutBottomSheet(),
    );
  }
}
