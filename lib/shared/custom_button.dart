import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double?width;
  final double?height;
  final Function()?onTap;
  final Color ?color;
  final double?radius;
  final Color?textColor;
  const CustomButton({super.key, required this.text, this.onTap, this.width, this.color, this.height, this.radius, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color:color?? AppColors.primary,
          borderRadius: BorderRadius.circular(radius??20),
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: textColor??Colors.white,
            size: 18,
            weight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
