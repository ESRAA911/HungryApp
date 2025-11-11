import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  final String hint;
  final bool isPass;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.hint,
    required this.isPass,
    required this.controller,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obsecureText;
  @override
  void initState() {
    _obsecureText = widget.isPass;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      cursorHeight: 20.h,
      cursorColor: AppColors.primary,

      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please enter ${widget.hint}';
        }
        null;
      },
      obscureText: _obsecureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,

        fillColor: Colors.transparent,
        filled: true,
        hintStyle: TextStyle(color: Colors.white),

        suffixIcon: widget.isPass
            ? GestureDetector(
                onTap: _togglePassword,

                child:Icon(
                  _obsecureText
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill,
                  color:Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
