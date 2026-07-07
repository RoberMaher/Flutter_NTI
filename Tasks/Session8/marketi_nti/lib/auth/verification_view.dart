// auth/verification_view.dart
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marketi_nti/auth/verification_cubit/verification_cubit.dart';
import 'package:marketi_nti/auth/widgets/back_button.dart';
import 'package:marketi_nti/auth/widgets/main_button.dart';
import 'package:marketi_nti/auth/widgets/otp_fields.dart';
import 'package:marketi_nti/auth/widgets/text_button.dart';

class VerificationView extends StatefulWidget {
  final String email;

  const VerificationView({super.key, required this.email});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  int seconds = 60;
  Timer? timer;

  String enteredCode = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer?.cancel();
    seconds = 60;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds <= 0) {
        t.cancel();
        return;
      }

      setState(() => seconds--);
    });
  }

  String formatTime(int s) => s.toString().padLeft(2, '0');

  void onVerify() {
    if (enteredCode.length != 6) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: 'Error',
        desc: 'Please enter the complete 6-digit code.',
        btnOkOnPress: () {},
      ).show();
      return;
    }

    context.read<VerificationCubit>().verifyEmail(
      email: widget.email,
      code: enteredCode,
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is VerificationLoading) {
          setState(() => isLoading = true);
        }

        if (state is VerificationSuccess) {
          setState(() => isLoading = false);

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Success',
            desc: 'Verification Successful!',
            btnOkOnPress: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/sign_in',
                (route) => false,
              );
            },
          ).show();
        }

        if (state is VerificationFailure) {
          setState(() => isLoading = false);

          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            desc: state.errorMessage,
            btnOkOnPress: () {},
          ).show();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              children: [
                /// 🔹 Header
                Row(
                  children: [
                    backButton(),
                    SizedBox(width: 8.w),
                    Text(
                      'Verification Code',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF51526C),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 44.h),

                Image.asset(
                  'assets/images/Illustration_Verification_Code_With_Phone.png',
                ),

                SizedBox(height: 22.h),

                Text(
                  'Please enter the 6 digit code sent to: 0123456789',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF51526C),
                  ),
                ),

                SizedBox(height: 25.h),

                /// 🔥 OTP
                OtpFields(
                  length: 6,
                  onCompleted: (code) {
                    setState(() {
                      enteredCode = code;
                    });
                  },
                ),

                SizedBox(height: 30.h),

                /// 🔥 BUTTON
                MainButton(
                  text: "Verify Code",
                  ontap: isLoading ? null : onVerify,
                  isLoading: isLoading,
                ),

                SizedBox(height: 20.h),

                /// 🔥 RESEND
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn’t receive code? "),
                    seconds > 0
                        ? Text(
                            "00:${formatTime(seconds)}",
                            style: const TextStyle(color: Colors.grey),
                          )
                        : textButton(
                            text: "Resend Code",
                            ontap: () {
                              startTimer();
                              // TODO: resend API
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
