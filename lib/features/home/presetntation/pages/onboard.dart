import 'package:currencsee/core/config/details/route_name.dart';
import 'package:currencsee/features/home/data/local/home_static_repo.dart';
import 'package:currencsee/features/home/data/local/homeimages.dart';
import 'package:currencsee/features/home/presetntation/bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../globalwidget/export.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    final text = HomestaticRepo.selectedTab.toString();
    final size = MediaQuery.sizeOf(context);
    final currentTab = context.watch<HomeCubit>().selectedTab;
    return AppScaffold(
        color: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      HomeImages.appIcon,
                      fit: BoxFit.cover,
                      width: size.width,
                    ),
                    SizedBox(height: size.height * 0.03),
                    AppText(
                        text: 'CurrenSee',
                        color: Appcolors.blackColor,
                        size: 35,
                        fontweight: FontWeight.w700),
                    SizedBox(height: size.height * 0.03),
                    AppText(
                        maxline: 4,
                        textalign: TextAlign.center,
                        text:
                            'We provide a broad user base for \nindividuals, travelers, and businesses to convert currencies and track exchange rates.',
                        color: Appcolors.blackColor,
                        fontweight: FontWeight.w300),
                    SizedBox(height: size.height * 0.07),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.all(size.width * 0.03),
              child: AppshadowContainer(
                onTap: () {
                  context.read<HomeCubit>().changeTab(text);
                },
                padding: EdgeInsets.all(size.width * 0.01),
                height: size.height * 0.07,
                radius: size.width * 0.3,
                color: Appcolors.blackColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppshadowContainer(
                      onTap: () {
                        context
                            .read<HomeCubit>()
                            .changeTab(HomestaticRepo.selectedTab[0]);
                        Navigator.pushNamed(context, RouteName.login);
                      },
                      color: currentTab == HomestaticRepo.selectedTab[0]
                          ? Appcolors.white
                          : Colors.transparent,
                      width: size.width * 0.46,
                      radius: size.width * 0.3,
                      padding: EdgeInsets.all(size.width * 0.009),
                      child: AppText(
                        text: 'Login',
                        color: currentTab == HomestaticRepo.selectedTab[0]
                            ? Appcolors.blackColor
                            : Appcolors.white,
                      ),
                    ),
                    AppshadowContainer(
                      onTap: () {
                        context
                            .read<HomeCubit>()
                            .changeTab(HomestaticRepo.selectedTab[1]);
                        Navigator.pushNamed(context, RouteName.signUp);
                      },
                      color: currentTab == HomestaticRepo.selectedTab[1]
                          ? Appcolors.white
                          : Colors.transparent,
                      width: size.width * 0.46,
                      radius: size.width * 0.3,
                      padding: EdgeInsets.all(size.width * 0.009),
                      child: AppText(
                        text: 'SignUp',
                        color: currentTab == HomestaticRepo.selectedTab[1]
                            ? Appcolors.blackColor
                            : Appcolors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.06)
          ],
        ));
  }
}
