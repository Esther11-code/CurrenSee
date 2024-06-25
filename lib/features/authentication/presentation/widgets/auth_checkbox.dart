import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/appcolors.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox(
      {super.key,
      this.status = false,
      this.width,
      this.height,
      this.radius,
      this.ontap});
  final bool status;
  final double? width, height, radius;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                border: Border.all(color: Appcolors.blue),
                color: status ? Appcolors.blue : Appcolors.white,
                borderRadius: BorderRadius.circular(radius ?? 5.sp)),
            child: Icon(Icons.done, size: 20.sp, color: Appcolors.white)));
  }
}
