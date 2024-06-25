import 'package:currencsee/core/config/details/custom_page_route.dart';
import 'package:currencsee/core/config/details/route_name.dart';
import 'package:currencsee/features/authentication/presentation/pages/login.dart';
import 'package:currencsee/features/currency/pages/currency.dart';
import 'package:flutter/cupertino.dart';

import '../../../features/authentication/presentation/pages/signup.dart';
import '../../../features/home/presetntation/pages/bottom_nav.dart';
import '../../../features/home/presetntation/pages/onboard.dart';

class AppRoute {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onboard:
        return CustomPageRoute(
            direction: AxisDirection.left,
            duration: 500,
            child: const Onboard());
      case RouteName.login:
        return CustomPageRoute(
            duration: 500, direction: AxisDirection.left, child: const Login());
      case RouteName.signUp:
        return CustomPageRoute(
            duration: 500,
            direction: AxisDirection.left,
            child: const SignUp());
      case RouteName.bottomnavs:
        return CustomPageRoute(
            direction: AxisDirection.left,
            duration: 500,
            child: const BottomNav());
      // case RouteName.selectCurrency:
      //   return CustomPageRoute(
      //       direction: AxisDirection.left,
      //       duration: 500,
      //       child: const CurrencyListScreen());

      default:
        return CustomPageRoute(child: const SignUp());
    }
  }
}
