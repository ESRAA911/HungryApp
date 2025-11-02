import 'package:flutter/material.dart';
import 'package:hungry_app/features/product/widgets/product_details_body.dart';
import 'package:hungry_app/features/product/widgets/product_details_bottom_sheet.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
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
      body: ProductDetailsBody(),
      bottomSheet: ProductDetailsBottomSheet(),
    );
  
  }
}
