import 'package:currencsee/core/config/details/route_name.dart';
import 'package:currencsee/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../globalwidget/app_backbutton.dart';
import '../../../../globalwidget/export.dart';
import '../widgets/auth_checkbox.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPassword = true;
  final ValueNotifier<bool> isFormValid = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    final watchAuth = context.read<AuthCubit>();
    watchAuth.firstnameController.addListener(validateForm);
    watchAuth.lastnameController.addListener(validateForm);
    watchAuth.emailController.addListener(validateForm);
    watchAuth.passwordController.addListener(validateForm);
  }

  void validateForm() {
    final watchAuth = context.read<AuthCubit>();
    bool isValid = watchAuth.firstnameController.text.isNotEmpty &&
        watchAuth.lastnameController.text.isNotEmpty &&
        watchAuth.emailController.text.isNotEmpty &&
        watchAuth.passwordController.text.isNotEmpty;
    isFormValid.value = isValid;
  }

  @override
  Widget build(BuildContext context) {
    final watchAuth = context.watch<AuthCubit>();
    final size = MediaQuery.of(context).size;
    return AppScaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        children: [
          const AppBackButton(),
          SizedBox(height: size.height * 0.02),
          const AppText(
            text: '''Let's get started\nwith your account
        ''',
            size: 35,
            fontweight: FontWeight.w500,
            maxline: 2,
          ),
          SizedBox(height: size.height * 0.05),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: size.width * 0.45,
              child: ApptextField(
                controller: watchAuth.firstnameController,
                hintText: 'First Name',
                prefixIcon: Icons.person_2_outlined,
              ),
            ),
            SizedBox(
              width: size.width * 0.45,
              child: ApptextField(
                controller: watchAuth.lastnameController,
                hintText: 'Last Name',
                prefixIcon: Icons.person_2_outlined,
              ),
            ),
          ]),
          SizedBox(height: size.height * 0.03),
          ApptextField(
            controller: watchAuth.emailController,
            hintText: '@Email',
            prefixIcon: Icons.email_outlined,
          ),
          SizedBox(height: size.height * 0.03),
          ApptextField(
            controller: watchAuth.passwordController,
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
          Row(
            children: [
              const AppCheckbox(),
              SizedBox(width: size.width * 0.02),
              const AppText(
                text: 'I Agree to terms and policy guideline',
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          ValueListenableBuilder<bool>(
            valueListenable: isFormValid,
            builder: (context, isValid, child) {
              return Appbutton(
                buttonColor:
                    isValid ? Appcolors.blackColor : Appcolors.inactiveColor,
                label: "Signup",
                labelColor: Appcolors.white,
                onTap: isValid
                    ? () {
                        Navigator.pushNamed(context, RouteName.bottomnavs);
                      }
                    : null,
              );
            },
          ),
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(text: 'Already have an account?'),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteName.login),
                child: const AppText(
                  text: 'Login',
                  fontweight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
