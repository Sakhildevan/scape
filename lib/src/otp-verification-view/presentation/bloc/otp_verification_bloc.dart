import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/otp-verification-view/data/repository/otp_verification_repository.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final OtpVerificationRepository otpVerificationRepository;
  OtpVerificationBloc({required this.otpVerificationRepository})
      : super(const OtpVerificationState()) {
    on<MyProfileUpdateQuizEvent>(_myProfileUpdateQuizEvent);
    on<ShowOtpError>(_showOtpError);
    on<StoreEmailTempToken>(_storeEmailTempToken);
    on<StoreOtp>(_storeOtp);
    on<ConfirmOtpEvent>(confirmOtp);
    on<ValidateOtpEvent>(_validateOtp);
    on<OtpNextBtnClicked>(_otpNextBtn);
    on<CheckSingPassVerification>(_checkSingPassVerification);
    on<OtVerificationResetEvent>(_resettingTheState);
  }

  FutureOr<void> _resettingTheState(
    OtVerificationResetEvent event,
    Emitter<OtpVerificationState> emit,
  ) {
    emit(state.copyWith(
      apiStatus: ApiStatus.initial,
      otp: "",
      tempToken: "",
      email: "",
    ));
  }

  FutureOr<void> _storeEmailTempToken(
      StoreEmailTempToken event, Emitter<OtpVerificationState> emit) {
    emit(state.copyWith(
      email: event.email,
      tempToken: event.tempToken,
    ));
  }

  FutureOr<void> _validateOtp(
      ValidateOtpEvent event, Emitter<OtpVerificationState> emit) {
    if (event.otp.isEmpty) {
      customErrorSnackBar(
        event.buildContext,
        message: "${StringConst.pleaseProvideTheOTP} ${state.email}",
      );
    } else {
      add(ConfirmOtpEvent(event.otp, event.buildContext));
    }
  }

  FutureOr<void> confirmOtp(
      ConfirmOtpEvent event, Emitter<OtpVerificationState> emit) {
    event.buildContext.read<RegistrationBloc>().add(
          ConfirmOtpApiEvent(
            tempLoginToken: state.tempToken,
            otp: event.otp,
            buildContext: event.buildContext,
            isFromRegistrationPage: false,
          ),
        );
  }

  FutureOr<void> _otpNextBtn(
      OtpNextBtnClicked event, Emitter<OtpVerificationState> emit) {
    logger.i("Login otp Validation");
    add(ValidateOtpEvent(
      state.otp.removeAllWhitespace(),
      event.context,
    ));
  }

  FutureOr<void> _checkSingPassVerification(CheckSingPassVerification event,
      Emitter<OtpVerificationState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    final registerResponse =
        await otpVerificationRepository.checkSingPassVerification();
    emit(state.copyWith(apiStatus: ApiStatus.completed));

    registerResponse.fold(
      (failure) {
        emit(state.copyWith(
          apiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (result) {
        emit(state.copyWith(
          apiStatus: ApiStatus.success,
        ));
      },
    );
  }

  FutureOr<void> _storeOtp(StoreOtp event, Emitter<OtpVerificationState> emit) {
    emit(state.copyWith(
      otp: event.otp,
    ));
  }

  FutureOr<void> _showOtpError(
      ShowOtpError event, Emitter<OtpVerificationState> emit) {
    emit(state.copyWith(otpError: true));
  }

  FutureOr<void> _myProfileUpdateQuizEvent(
    MyProfileUpdateQuizEvent event,
    Emitter<OtpVerificationState> emit,
  ) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));

    final registerResponse =
        await otpVerificationRepository.myProfileUpdateQuiz();
    emit(state.copyWith(initialApiStatus: ApiStatus.completed));

    registerResponse.fold(
      (failure) {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (result) {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.success,
        ));
        if (event.navigateTicketBooking == true) {
          event.context.go(StringConst.ticketBookingViewRoute);
        } else if (event.navigateTicketBooking == false) {
          event.context.go(StringConst.retrieveMyInfoViewRoute);
        } else {
          event.context.go(StringConst.profileViewRoute);
        }
      },
    );
  }
}
