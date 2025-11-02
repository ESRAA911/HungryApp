import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ToppingCard extends StatelessWidget {
   final String image;
   final String title;
   final Function() onTap;

  const ToppingCard({super.key, required this.image, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 140,
        decoration: BoxDecoration(
          color: Color(0xff3C2F2F),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),

                child: Image.asset(
                  image,
                  width: 120,
                  height: 85,
                ),
              ),
              Gap(7),
              Container(
                color: Color(0xff3C2F2F),
                child: Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Gap(10),
                    CustomText(
                      text: title,
                      color: Colors.white,
                      size: 16,
                      weight: FontWeight.w500,
                      
                      ),
                      Gap(22),
                      GestureDetector(
                        onTap: onTap,
                        child: CircleAvatar(
                          
                          radius: 14,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                      )
                  ],
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
