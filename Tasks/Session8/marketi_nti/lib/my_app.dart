import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/forgot_password.dart';
import 'package:marketi_nti/auth/sign_in_view.dart';
import 'package:marketi_nti/auth/sign_up_view.dart';
import 'package:marketi_nti/cart/cart_view.dart';
import 'package:marketi_nti/home/home_view.dart';
import 'package:marketi_nti/navigation/bottom_navigation_bar.dart';
import 'package:marketi_nti/on_boarding/on_boarding.dart';

class MarktiNtiApp extends StatelessWidget {
  const MarktiNtiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/onboarding',
        routes: {
          '/sign_in': (context) => SignInView(),
          '/onboarding': (context) => OnBoarding(),
          '/sign_up': (context) => SignUpView(),
          '/forgot_password': (context) => ForgotPassword(),
          '/home': (context) => HomeView(),
          '/bottom_navigation': (context) => BottomNavBar(),
          '/cart': (context) => const CartView(),
        },
      ),
    );
  }
}
