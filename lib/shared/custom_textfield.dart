import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextfield extends StatefulWidget {
  final String hint;
  final bool isPass;
  final bool isEmail;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.hint,
    required this.isPass,
    required this.controller, required this.isEmail,
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
  bool isValidEmail(String email) {
  final regex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  return regex.hasMatch(email);
}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w500),
      controller: widget.controller,
      cursorHeight: 22.h,
      cursorWidth: 2.w,
      cursorColor:Colors.white,

      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please enter ${widget.hint}';
        }
        if(widget.isEmail){
          if(!isValidEmail(v.trim())){
            return 'please enter a valid email';
          }

        }
        null;
      },
      obscureText: _obsecureText,
      decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
        enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5.w,
            ),
          
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5.w,
            ),
        ),
        hintText: widget.hint,

         fillColor: Colors.white.withOpacity(0.05),
        filled: true,
        hintStyle: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w400),

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
