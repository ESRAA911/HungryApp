import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/cart/data/cart_model.dart';
import 'package:hungry_app/features/cart/data/cart_repo.dart';
import 'package:hungry_app/features/cart/widgets/cart_body.dart';
import 'package:hungry_app/features/cart/widgets/cart_bottom_sheet.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<int> quantities=[]; 
  bool isLoading=false;
 int itemCount=0;
  CartRepo cartRepo=CartRepo();
  GetCartResponseModel ?cartResponse;
  Future<void> getCartData()async{
    try{
      final res=await cartRepo.GetCartData();
    
      setState(() {
         itemCount=res!.cartData.items.length;
        cartResponse=res;
         quantities = List.generate(itemCount!, (_) => 1);
      });
    }catch(e){
      print(e.toString());
    }
  }
  Future<void> removeCartItem(int id)async{
    try{
      setState(() {
        isLoading=true;
      });
      final res=await cartRepo.removeCartItem(id);
      getCartData();
      ScaffoldMessenger.of(context).showSnackBar(customSnack('cart item deleted successfully', Colors.green));
      setState(() {
        isLoading=false;
      });
    }catch(e){
      setState(() {
        isLoading=false;
      });
     ScaffoldMessenger.of(context).showSnackBar(customSnack('can not remove cart item', Colors.green)); 
    }
  }
  
  @override
  void initState() {
    getCartData();
    super.initState();
  }

  void onAdd(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMinus(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: cartResponse==null,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.h,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body:CartBody(itemCount: itemCount, isLoading: isLoading, quantities: quantities, onAdd: onAdd, onMinus: onMinus, removeCartItem: removeCartItem,cartResponse:cartResponse ,),
        bottomSheet:  CartBottomSheet(cartResponse: cartResponse,),
      ),
    );
  }
}
