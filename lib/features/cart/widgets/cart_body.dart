import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/cart/data/cart_model.dart';
import 'package:hungry_app/features/cart/widgets/cart_item.dart';

class CartBody extends StatefulWidget {
  final int itemCount;
  final GetCartResponseModel? cartResponse;
  final bool isLoading;
  final List<int> quantities;
  final Function onAdd;
  final Function onMinus;
  final Function removeCartItem;
  const CartBody({
    super.key,
    required this.itemCount,
    this.cartResponse,
    required this.isLoading,
    required this.quantities,
    required this.onAdd,
    required this.onMinus,
    required this.removeCartItem,
  });

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 120, top: 10),
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          final item = widget.cartResponse?.cartData.items[index];
          if (item == null) return CupertinoActivityIndicator();
          return CardItem(
            isLoading: widget.isLoading,
            image: item.image,
            title: item.name,
            spicy: item.spicy.toString(),
            num: widget.quantities[index],
            onAdd: () => widget.onAdd(index),
            onMin: () => widget.onMinus(index),
            onRemove: () {
              widget.removeCartItem(item.itemId);
            },
            toppingsCount: item.toppings.length,
            optionsCount: item.sideOptions.length,
            toppingImages: item.toppings.map((e) => e.image).toList(),
            optionImages: item.sideOptions.map((e) => e.image).toList(),
          );
        },
      ),
    );
  }
}
