import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/views/profile_view.dart';
import 'package:hungry_app/features/cart/views/cart_view.dart';
import 'package:hungry_app/features/home/views/home_view.dart';
import 'package:hungry_app/features/orderHistory/views/order_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller=PageController();
  late List<Widget>screens;
  int currentScreen=0;
  @override
  void initState() {
    screens=[
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];
    controller=PageController(initialPage: currentScreen);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //can not return back 
      child: Scaffold(
        body: PageView(
         physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: screens,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentScreen,
            onTap: (index){
              setState(() {
                currentScreen=index;
              });
              controller.jumpToPage(currentScreen);
            },
            items: [
              BottomNavigationBarItem(
                icon:Icon(CupertinoIcons.home),
                label: 'Home' 
                
                ),
                BottomNavigationBarItem(
                icon:Icon(CupertinoIcons.cart),
                label: 'Cart',
                
                
                ),
                BottomNavigationBarItem(
                icon:Icon(Icons.local_restaurant_sharp),
                label: 'Order History' 
                ),
                BottomNavigationBarItem(
                icon:Icon(CupertinoIcons.profile_circled),
                label: 'Profile' 
                ),
          
            ]
            ),
        ),
      ),
    );
  }
}