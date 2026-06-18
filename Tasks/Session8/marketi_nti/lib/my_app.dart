import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketi_nti/auth/forgot_password.dart';
import 'package:marketi_nti/auth/sign_in_view.dart';
import 'package:marketi_nti/auth/sign_up_cubit/sign_up_cubit.dart';
import 'package:marketi_nti/auth/sign_up_view.dart';
import 'package:marketi_nti/auth/verification_cubit/verification_cubit.dart';
import 'package:marketi_nti/auth/verification_view.dart';
import 'package:marketi_nti/cart/cart_view.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/home/home_view.dart';
import 'package:marketi_nti/navigation/bottom_navigation_bar.dart';
import 'package:marketi_nti/on_boarding/on_boarding.dart';
import 'package:marketi_nti/profile/Profile_cubit/profile_cubit.dart';
import 'package:marketi_nti/profile/profile_view.dart';

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
          '/sign_in': (context) => BlocProvider(
            create: (context) => SignInCubit(apiConsumer: ApiConsumer()),
            child: SignInView(),
          ),
          '/onboarding': (context) => OnBoarding(),
          '/sign_up': (context) => BlocProvider(
            create: (context) => SignUpCubit(apiConsumer: ApiConsumer()),
            child: SignUpView(),
          ),
          '/forgot_password': (context) => ForgotPassword(),
          '/home': (context) => HomeView(),
          '/bottom_navigation': (context) => BottomNavBar(),
          '/cart': (context) => CartView(),
          '/verification': (context) {
            final args = ModalRoute.of(context)?.settings.arguments;

            final email = (args is String) ? args : '';

            return BlocProvider(
              create: (context) =>
                  VerificationCubit(apiConsumer: ApiConsumer()),
              child: VerificationView(email: email),
            );
          },
          '/profile': (context) => BlocProvider(
            create: (context) => ProfileCubit(apiConsumer: ApiConsumer()),
            child: ProfileView(),
          ),
        },
      ),
    );
  }
}
