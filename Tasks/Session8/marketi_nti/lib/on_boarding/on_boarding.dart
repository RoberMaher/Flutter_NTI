import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:marketi_nti/on_boarding/custom_page_view.dart';

class OnBoarding extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final GlobalKey<IntroductionScreenState> _introKey =
      GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomPageView(introKey: _introKey));
  }
}
