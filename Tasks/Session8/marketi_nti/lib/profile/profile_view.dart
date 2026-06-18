import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Loading user data...")),
          );
        }
        if (state is ProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User data loaded successfully!")),
          );
        }
        if (state is ProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const CircularProgressIndicator();
              }

              if (state is ProfileSuccess) {
                final user = ProfileViewDataModel.fromJson(state.profileViewDataModel.toJson());

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name: ${user.fullName ?? ''}"),
                    Text("Email: ${user.email ?? ''}"),
                  ],
                );
              }

              return const Text("Profile View");
            },
          ),
        ),
      ),
    );
  }
}
