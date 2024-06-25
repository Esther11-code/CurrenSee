import 'package:currencsee/core/constants/exports.dart';
import 'package:flutter/material.dart';
import 'export.dart';

class Appbutton extends StatelessWidget {
  const Appbutton(
      {super.key,
      this.buttonColor,
      this.child,
      this.label,
      this.onTap,
      this.width,
      this.height,
      this.labelColor});

  final Color? buttonColor, labelColor;
  final Widget? child;
  final String? label;
  final Function()? onTap;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
        onTap: onTap,
        shadowcolour: Colors.transparent,
        width: width ?? size.width,
        height: height ?? size.height * 0.065,
        radius: size.width * 0.1,
        color: buttonColor ?? Appcolors.buttonColor,
        child: child ??
            AppText(
                text: label ?? '',
                color: labelColor ?? Appcolors.blackColor,
                size: 14,
                fontweight: FontWeight.w600));
  }
}
