import 'package:currencsee/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:currencsee/features/currency/pages/bloc/cubit/currency_cubit.dart';
import 'package:currencsee/features/home/presetntation/bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/details/route.dart';
import 'core/config/details/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => CurrencyCubit()),
        ],
        child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: MediaQuery.sizeOf(context),
            builder: (context, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'CurrenSee',
                  theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.white),
                      useMaterial3: true),
                  initialRoute: RouteName.onboard,
                  onGenerateRoute: AppRoute.onGeneratedRoute);
            }));
  }
}
