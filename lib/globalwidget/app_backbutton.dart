import 'package:currencsee/core/constants/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.color,
    this.size,
  });
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.arrow_left,
            size: size ?? 30.sp,
            color: color ?? Appcolors.blackColor,
          ),
        ],
      ),
    );
  }
}
