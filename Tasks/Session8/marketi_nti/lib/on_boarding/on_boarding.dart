import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:marketi_nti/auth/widgets/main_button.dart';

class OnBoarding extends StatefulWidget {
  static const String routeName = '/onboarding';
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to My App',
              body: 'This is the first page of the onboarding process.',
              image: Image.asset('assets/images/onboarding1.png'),
            ),
            PageViewModel(
              image: Image.asset('assets/images/onboarding1.png'),

              titleWidget: Column(
                children: [
                  const SizedBox(height: 10),

                  const SizedBox(height: 20),

                  const Text(
                    "Easy to Buy",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              bodyWidget: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Find the perfect item that suits your style...",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            PageViewModel(
              title: 'Get Started',
              body: 'Let\'s get started using the app!',
              image: Image.asset('assets/images/onboarding3.png'),
            ),
          ],

          overrideNext: (context, onPressed) => SizedBox(
            width: double.infinity,
            height: 48.h,
            child: MainButton(text: "Next", ontap: onPressed),
          ),

          showSkipButton: false,
          overrideDone: (context, onPressed) =>
              MainButton(text: "Get Started", ontap: onPressed),
          onDone: () {
            Navigator.pushReplacementNamed(context, '/sign_in');
          },
          // dotsDecorator: const DotsDecorator(
          //   size: Size(10, 10),
          //   color: AppColors.light_blue_500,
          //   activeColor: AppColors.light_blue_100,
          //   activeSize: Size(22, 10),
          //   activeShape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(24)),
          //   ),
          // ),
        ),
      ),
    );
  }
}
