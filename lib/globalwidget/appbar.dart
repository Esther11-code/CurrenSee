
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/exports.dart';
import '../features/home/presetntation/bloc/cubit/home_cubit.dart';
import 'export.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppshadowContainer(
            radius: size.width * 0.08,
            padding: EdgeInsets.all(size.width * 0.015),
            onTap: () => Navigator.pop(context),
            child: Icon(CupertinoIcons.arrow_left,
                size: 25.sp, color: Appcolors.blackColor)),
        AppText(text: title, fontweight: FontWeight.w600),
        AppshadowContainer(
            radius: size.width * 0.08,
            padding: EdgeInsets.all(size.width * 0.015),
            onTap: () => context.read<HomeCubit>().changeBottomNav(2),
            child: Icon(Icons.shopping_bag,
                size: 25.sp, color: Appcolors.blackColor)),
      ],
    );
  }
}
