import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final double ?letterSpace;
  final double ?height;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.weight,
    this.size,
    this.height,
    this.letterSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: letterSpace,
        ),
    );
  }
}
