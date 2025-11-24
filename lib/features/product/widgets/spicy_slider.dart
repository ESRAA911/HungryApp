import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final String image;
  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.image,
  });

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatAnimation.value),
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Image.network(
                  widget.image,
                  height: 220.h,
                  width: 180.w,
                ),
              ),
            );
          },
        ),
        Column(
          children: [
            CustomText(
              text:
                  'Customize Your Burger\n to Your Tastes. Ultimate\n Experience',
              color: Color(0xff3C2F2F),
            ),
            Slider(
              value: widget.value,
              onChanged: widget.onChanged,
              inactiveColor: Colors.grey.shade300,
              activeColor: AppColors.primary,
              min: 0,
              max: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: '🥶'),
                Gap(115),
                CustomText(text: '🌶️'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}