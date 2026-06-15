import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final ApiConsumer apiConsumer;

  VerificationCubit({required this.apiConsumer}) : super(VerificationInitial());

  Future<void> verifyEmail({
    required String email,
    required String code,
  }) async {
    emit(VerificationLoading());

    try {
      await apiConsumer.post(
        url: 'https://accessories-eshop.runasp.net/api/auth/verify-email',
        data: {"email": email.trim(), "otp": code.trim()},
      );

      emit(VerificationSuccess());
    } on DioException catch (e) {
      emit(VerificationFailure(errorMessage: handleError(e)));
    }
  }
}
