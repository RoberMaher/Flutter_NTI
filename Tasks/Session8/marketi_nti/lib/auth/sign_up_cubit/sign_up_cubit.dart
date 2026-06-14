import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.apiConsumer}) : super(SignUpInitial());

  final ApiConsumer apiConsumer;
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoading());
      await apiConsumer.post(
        url: 'https://accessories-eshop.runasp.net/api/auth/register',
        data: {"firstName": firstName, "lastName": lastName, "email": email, "password": password},
      );
      emit(SignUpSuccess());
    } on DioException catch (e) {
      emit(SignUpFailure(errorMessage: handleError(e)));
    }
  }

}
