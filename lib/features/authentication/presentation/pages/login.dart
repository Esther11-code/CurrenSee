import 'package:currencsee/core/config/details/route_name.dart';
import 'package:currencsee/core/constants/appcolors.dart';
import 'package:currencsee/core/constants/exports.dart';
import 'package:currencsee/globalwidget/export.dart';
import 'package:flutter/material.dart';
import '../../../../globalwidget/app_backbutton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            children: [
          AppBackButton(
            color: Appcolors.blackColor,
          ),
          SizedBox(height: size.height * 0.02),
          const AppText(
            text: 'Hey,\nWelcome\nBack!',
            size: 35,
            fontweight: FontWeight.w500,
            maxline: 3,
          ),
          SizedBox(height: size.height * 0.05),
          const ApptextField(
              hintText: '@Email', prefixIcon: Icons.email_outlined),
          SizedBox(height: size.height * 0.03),
          ApptextField(
            obscureText: showPassword,
            hintText: 'Password',
            prefixIcon: Icons.lock_outline,
            sufixWidget: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: showPassword
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          const Align(
              alignment: Alignment.centerRight,
              child: AppText(
                  text: 'Forget Password?',
                  size: 14,
                  fontweight: FontWeight.w500)),
          SizedBox(height: size.height * 0.03),
          Appbutton(
              onTap: () {
                Navigator.pushNamed(context, RouteName.bottomnavs);
              },
              buttonColor: Appcolors.blackColor,
              label: "Login",
              labelColor: Appcolors.white),
          SizedBox(height: size.height * 0.02),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const AppText(text: 'Don\'t have an acoount? '),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteName.signUp),
                child:
                    const AppText(text: 'Signup', fontweight: FontWeight.w600))
          ])
        ]));
  }
}
