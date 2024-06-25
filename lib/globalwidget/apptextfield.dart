import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/appcolors.dart';

class ApptextField extends StatelessWidget {
  const ApptextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.controller,
    this.prefixWidget,
    this.sufixWidget,
    this.obscureText = false,
  });
  final String hintText;
  final IconData? prefixIcon, sufixIcon;
  final Widget? prefixWidget, sufixWidget;
  final TextEditingController? controller;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TextField(obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            suffixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Appcolors.blackColor
                    : Appcolors.blackColor.withOpacity(0.4)),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Appcolors.blackColor
                    : Appcolors.blackColor.withOpacity(0.4)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.3),
                borderSide:
                    BorderSide(color: Appcolors.blackColor.withOpacity(0.4))),
            contentPadding: EdgeInsets.all(size.width * 0.04),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.3),
                borderSide: BorderSide(color: Appcolors.blackColor)),
            hintText: hintText,
            suffixIcon: sufixWidget ?? Icon(sufixIcon, size: 25.sp),
            prefixIcon: prefixWidget ?? Icon(prefixIcon, size: 25.sp)));
  }
}
