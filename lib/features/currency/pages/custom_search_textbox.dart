import 'package:currencsee/core/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchTextBox extends StatelessWidget {
  const CustomSearchTextBox(
      {super.key,
      required this.size,
      required this.controller,
      this.hintText = "Search code",
      this.textInputAction,
      this.prefixIcon,
      this.sufixIcon,
      this.fontStyle,
      this.enable,
      this.onChanged,
      this.fillColor,
      this.hintColor,
      this.onFieldSubmitted,
      this.applyBorderGradient = true,
      this.borderRadius});

  final Size size;
  final TextEditingController controller;
  final String hintText;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final FontStyle? fontStyle;
  final bool? enable;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final Color? hintColor;
  final BorderRadius? borderRadius;
  final bool applyBorderGradient;
  final void Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.05,
      padding: EdgeInsets.all(size.width * 0.003),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(size.width * 0.04),
        gradient: !applyBorderGradient
            ? null
            : const LinearGradient(
                begin: Alignment(1.00, 0.01),
                end: Alignment(-1, -0.01),
                colors: [
                  Color(0xFF00FFFF),
                  Color(0xFF00AFEF),
                  Color(0xFF2D5FAA),
                ],
              ),
        // color: Color(0x26C4C4C4),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Appcolors.white,
          borderRadius:
              borderRadius ?? BorderRadius.circular(size.width * 0.04),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: enable,
                controller: controller,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: textInputAction,
                style: GoogleFonts.roboto(
                  color: hintColor,
                  fontSize: 16.sp,
                  fontStyle: fontStyle,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: onChanged,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                onFieldSubmitted: onFieldSubmitted,
                decoration: InputDecoration(
                  prefixIcon: prefixIcon ??
                      Icon(
                        Icons.search,
                        color: const Color(0xFF2D5FAA).withOpacity(0.7),
                        size: 25.sp,
                      ),
                  suffixIcon: sufixIcon,
                  border: OutlineInputBorder(
                    borderRadius: borderRadius ??
                        BorderRadius.circular(size.width * 0.04),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintStyle: GoogleFonts.roboto(
                    color: hintColor,
                    fontSize: 16.sp,
                    fontStyle: fontStyle,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: hintText,
                  contentPadding: EdgeInsets.only(
                      top: size.height * 0.01,
                      bottom: size.height * 0.01,
                      left: size.width * 0.04,
                      right: size.width * 0.04),
                  fillColor: fillColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
