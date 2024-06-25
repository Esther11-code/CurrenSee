import 'package:currencsee/core/constants/appcolors.dart';
import 'package:currencsee/features/currency/data/models/currency_model.dart';
import 'package:currencsee/globalwidget/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key, required this.country});
final Country country;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              leading: InkWell(
                child: Icon(
                  Icons.menu_rounded,
                  color: Appcolors.blackColor,
                ),
                onTap: () {},
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_rounded,
                    size: 25.sp,
                    color: Appcolors.blackColor,
                  ),
                )
              ],
              title: const Text('Currency Converter'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: size.height * 0.03),
            AppshadowContainer(
              color: Appcolors.white,
              shadowcolour: Appcolors.blackColor.withOpacity(0.2),
              width: size.width * 0.9,
              height: size.height * 0.2,
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SvgPicture.network(
                    country.flag ?? '', // Replace with your actual flag URL
                    width: 32.w,
                    height: 32.h,
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(),
                  ),
                ),
                title: Text(
                  country.code ?? '', // Replace with your actual code
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(country.countryName ??
                    ''), // Replace with your actual country name
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Appcolors.blackColor, size: 25.sp),
              ),
            ),
            SizedBox(height: size.height * 0.025),
            AppshadowContainer(
              padding: EdgeInsets.all(size.width * 0.008),
              color: Appcolors.blackColor.withOpacity(0.2),
              width: size.width * 0.46,
              height: size.height * 0.06,
              border: true,
              radius: size.width * 0.01,
              borderColor: Appcolors.blackColor.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.swap_vert,
                    size: 30.sp,
                  ),
                  const SizedBox(width: 8),
                  const AppText(text: "Switch Currencies", size: 16),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),
            AppshadowContainer(
              color: Appcolors.white,
              shadowcolour: Appcolors.blackColor.withOpacity(0.2),
              width: size.width * 0.9,
              height: size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
