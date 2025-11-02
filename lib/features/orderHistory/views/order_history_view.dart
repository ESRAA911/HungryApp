import 'package:flutter/material.dart';
import 'package:hungry_app/features/orderHistory/widgets/order_history_body.dart';
class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body:OrderHistoryBody(),
    );
  }
}
