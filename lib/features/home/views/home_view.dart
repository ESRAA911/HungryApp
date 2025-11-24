import 'package:flutter/material.dart';
import 'package:hungry_app/features/home/data/product_model.dart';
import 'package:hungry_app/features/home/data/product_repo.dart';
import 'package:hungry_app/features/home/widgets/custom_sliver_padding.dart';
import 'package:hungry_app/features/home/widgets/custom_slivertooxAdapter.dart';

import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   ProductRepo productRepo=ProductRepo();
  List<ProductModel>?products;
  Future<void>getProducts() async{
    final response =await productRepo.getProducts();
    setState(() {
      products=response;
    });
  }
  @override
  void initState(){
    getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Skeletonizer(
        enabled: products==null,
        containersColor: Colors.transparent,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomSlivertooxadapter(),
              CustomSliverPadding(products: products,),
            ],
          ),
        ),
      ),
    );
  }
}
