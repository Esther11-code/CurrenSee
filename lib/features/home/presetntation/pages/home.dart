import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:currencsee/core/constants/appcolors.dart';
import 'package:currencsee/features/currency/data/models/currency_model.dart';
import 'package:currencsee/features/currency/pages/bloc/cubit/currency_cubit.dart';
import 'package:currencsee/globalwidget/export.dart';
import 'package:currencsee/core/config/details/route_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.country});

  final CountryInfoModel country;

  void converter(BuildContext context, TextEditingController controller1,
      TextEditingController controller2) {
    final selectedCountry = context.read<CurrencyCubit>().selectedCountry;

    if (controller1.text.isNotEmpty) {
      try {
        final amount = double.parse(controller1.text);
        final result = amount * selectedCountry.exchangeRate!;
        controller2.text = result.toStringAsFixed(2);
      } catch (e) {
        log('Error converting currency: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selectedCountry = context.watch<CurrencyCubit>().selectedCountry;
    final targetCountry = context.watch<CurrencyCubit>().targetCountry;

    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();

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
              padding: EdgeInsets.all(size.width * 0.03),
              color: Appcolors.white,
              shadowcolour: Appcolors.blackColor.withOpacity(0.2),
              width: size.width * 0.95,
              height: size.height * 0.2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              targetCountry.name ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              targetCountry.code ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Appcolors.blackColor, size: 25.sp),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.03),
                    child: TextField(
                      controller: controller1,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIconConstraints:
                            const BoxConstraints(minHeight: 0, minWidth: 0),
                        suffixIcon: AppText(text: selectedCountry.symbol ?? ''),
                        hintText: '1.00',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Appcolors.blackColor.withOpacity(0.4)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Appcolors.blackColor.withOpacity(0.4)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppshadowContainer(
                  onTap: () {
                    converter(context, controller1, controller2);
                  },
                  radius: size.width * 0.01,
                  width: size.width * 0.15,
                  height: size.height * 0.06,
                  color: Appcolors.white,
                  shadowcolour: Appcolors.blackColor.withOpacity(0.2),
                  child: const Center(
                    child: AppText(
                      text: '=',
                      fontweight: FontWeight.w800,
                      size: 25,
                    ),
                  ),
                ),
                AppshadowContainer(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.switchCurrency)
                        .then((value) {
                      // Handle result from currency switch screen if needed
                      if (value != null && value is CountryInfoModel) {
                        context
                            .read<CurrencyCubit>()
                            .changeCountry(country: value);
                      }
                    });
                  },
                  padding: EdgeInsets.all(size.width * 0.008),
                  color: Appcolors.blackColor.withOpacity(0.2),
                  width: size.width * 0.43,
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
                      SizedBox(width: size.width * 0.008),
                      const AppText(text: "Switch Currencies", size: 15),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),
            AppshadowContainer(
              padding: EdgeInsets.all(size.width * 0.03),
              color: Appcolors.white,
              shadowcolour: Appcolors.blackColor.withOpacity(0.2),
              width: size.width * 0.95,
              height: size.height * 0.2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedCountry.name ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              selectedCountry.code ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Appcolors.blackColor, size: 25.sp),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.04),
                    child: TextField(
                      controller:
                          controller2, // Bind to the second text field for result
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIconConstraints:
                            const BoxConstraints(minHeight: 0, minWidth: 0),
                        suffixIcon: AppText(text: selectedCountry.symbol ?? ''),
                        hintText: 'Converted amount',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Appcolors.blackColor.withOpacity(0.4)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Appcolors.blackColor.withOpacity(0.4)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
