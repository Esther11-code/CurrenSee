
import 'package:currencsee/core/constants/appcolors.dart';
import 'package:currencsee/globalwidget/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppshadowContainer(
                    color: Appcolors.white,
                    shadowcolour: Appcolors.blackColor.withOpacity(0.2),
                    width: size.width * 0.9,
                    height: size.height * 0.2,
                    child: Column(
                      children: [
                        Container(
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
                                ,
                                width: 32.w,
                                height: 32.h,
                                placeholderBuilder: (context) =>
                                    const CircularProgressIndicator(),
                              ),
                            ),
                            title: Text(
                              currency.code,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              currency.name,
                              style: GoogleFonts.notoSans(),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Appcolors.blackColor,
                              size: 25.sp,
                            ),
                          ),
                                           )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  AppshadowContainer(
                    // onTap: () =>
                    //     Navigator.pushNamed(context, RouteName.selectCurrency),
                    padding: EdgeInsets.all(size.width * 0.008),
                    color: Appcolors.blackColor.withOpacity(0.2),
                    width: size.width * 0.46,
                    height: size.height * 0.06,
                    border: true,
                    radius: size.width * 0.01,
                    borderColor: Appcolors.blackColor.withOpacity(0.3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.swap_vert,
                          size: 30.sp,
                        ),
                        const AppText(text: "Switch Currencies", size: 16)
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
            )
          ],
        ),
      ),
    );
  }
}
