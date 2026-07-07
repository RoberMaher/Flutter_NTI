// profile/profile_view.dart
// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_color.dart';
import 'package:marketi_nti/profile/Profile_cubit/profile_cubit.dart';
import 'package:marketi_nti/profile/model/profile_view_data_model.dart';

class ProfileView extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Loading user data...")));
        }
        if (state is ProfileSuccess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            title: 'Success',
            desc: 'Profile data loaded successfully!',
            btnOkOnPress: () {},
          ).show();
        }
        if (state is ProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18.sp, fontFamily: 'Poppins'),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: AppColors.dark_blue_900,
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileSuccess) {
              final user = ProfileViewDataModel.fromJson(
                state.profileViewDataModel.toJson(),
              );

              return SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    // --- Profile Header Section ---
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                                backgroundColor: AppColors.light_blue_500
                                    .withOpacity(0.2),
                                child: Icon(
                                  Icons.person,
                                  size: 50.r,
                                  color: AppColors.dark_blue_900,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 18.r,
                                  backgroundColor: AppColors.light_blue_500,
                                  child: Icon(
                                    Icons.edit,
                                    size: 16.r,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            user.fullName ?? "User Name",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: AppColors.dark_blue_900,
                            ),
                          ),
                          Text(
                            user.email ?? "Email not provided",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // --- Profile Details Section ---
                    // Using a custom field that matches your CustomTextFormField style
                    ProfileInfoField(
                      label: "Full Name",
                      value: user.fullName ?? "N/A",
                      iconPath:
                          "assets/icons/user.png", // Replace with your actual icon path
                    ),
                    SizedBox(height: 15.h),
                    ProfileInfoField(
                      label: "Email Address",
                      value: user.email ?? "N/A",
                      iconPath:
                          "assets/icons/email.png", // Replace with your actual icon path
                    ),
                    SizedBox(height: 15.h),
                    ProfileInfoField(
                      label: "Phone Number",
                      iconPath:
                          "assets/icons/phone.png", // Replace with your actual icon path
                    ),

                    SizedBox(height: 30.h),

                    // Logout Button
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Logout
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 60,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "No profile data found",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// This widget mimics your CustomTextFormField but is designed for VIEWING data
class ProfileInfoField extends StatelessWidget {
  final String label;
  final String? value;
  final String iconPath;

  const ProfileInfoField({
    super.key,
    required this.label,
    this.value,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.dark_blue_900,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 0.5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.light_blue_500.withAlpha(100),
              width: 2.w,
            ),
            color: Colors
                .grey
                .shade50, // Slight background to indicate it's read-only
          ),
          child: Row(
            children: [
              Image.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.info,
                  size: 20.w,
                  color: AppColors.light_blue_500,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  value ?? "N/A",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
