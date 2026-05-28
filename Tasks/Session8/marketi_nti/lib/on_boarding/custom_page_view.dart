import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:marketi_nti/auth/sign_in_view.dart';
import 'package:marketi_nti/core/app_color.dart';

class CustomPageView extends StatefulWidget {
  final GlobalKey<IntroductionScreenState> introKey;

  const CustomPageView({super.key, required this.introKey});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int _currentPage = 0;
  final int _totalPages = 3;

  void _onIntroEnd(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => SignInView()));
  }

  @override
  Widget build(BuildContext context) {
    // Determine button text dynamically based on the current page index
    final String buttonText = (_currentPage == _totalPages - 1)
        ? 'Get Started'
        : 'Next';

    return IntroductionScreen(
      key: widget.introKey,
      controlsPosition: Position(bottom: 50.h, left: 20.w, right: 20.w),
      dotsDecorator: const DotsDecorator(
        activeColor: AppColors.dark_blue_900,
        size: Size(16, 16),
        activeSize: Size(22, 22),
      ),
      onChange: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      globalFooter: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF3F80FF),
            borderRadius: BorderRadius.circular(14.r),
          ),

          child: MaterialButton(
            onPressed: () {
              if (_currentPage < _totalPages - 1) {
                // Move to the next page programmatically
                widget.introKey.currentState?.animateScroll(_currentPage + 1);
              } else {
                _onIntroEnd(context);
              }
            },
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: Text(
            'Welcome to Marketi',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          bodyWidget: SizedBox(
            width: 208.w,
            height: 115.h,
            child: Text(
              'Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.36.h,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          image: Image.asset('assets/images/onboarding1.png'),
        ),

        PageViewModel(
          titleWidget: Text(
            'Easy to Buy',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          bodyWidget: SizedBox(
            width: 319.w,
            height: 57.h,
            child: Text(
              'Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.36.h,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          image: Image.asset('assets/images/onboarding2.png'),
        ),
        PageViewModel(
          titleWidget: Text(
            'Wonderful User Experience',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          bodyWidget: SizedBox(
            width: 311.w,
            height: 38.h,
            child: Text(
              'Start exploring now and experience the convenience of online shopping at its best.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.36.h,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          image: Image.asset('assets/images/onboarding2.png'),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: false,
    );
  }
}
