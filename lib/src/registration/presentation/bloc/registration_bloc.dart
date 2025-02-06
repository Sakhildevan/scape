import 'dart:async';
// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/home/presentation/bloc/home_bloc.dart';
import 'package:scape/src/registration/data/repository/registration_repository.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository registrationRepository;
  RegistrationBloc({required this.registrationRepository})
      : super(RegistrationInitial()) {
    on<CancelClicked>(_cancelButtonClicked);
    on<ShowRegistrationEvent>(_showRegistrationView);
    on<NextRegistrationViewClicked>(_nextRegistrationButtonClicked);
    on<RegistrationValidationEvent>(_registrationValidation);
    on<EmailValidationEvent>(_emailValidation);
    on<OtpValidationEvent>(_otpValidation);
    on<LoginWithEmailApiEvent>(_loginWithEmailEvent);
    on<RegisterWithEmailApiEvent>(_registerWithEmailEvent);
    on<ConfirmOtpApiEvent>(_confirmOtpEvent);
    on<SetInitialEvent>(_setInitialValue);
    on<CheckboxChangeTCEvent>(checkboxStatusTCChange);
    on<CheckboxChangeMarketingConsentEvent>(
        checkboxStatusMarketingConsentChange);
    on<CheckLoginValidationEvent>(_checkLoginValidationEvent);
    // on<GetReCaptchaToken>(_getReCaptchaToken);
  }

  // FutureOr<void> _getReCaptchaToken(
  //   GetReCaptchaToken event,
  //   Emitter<RegistrationState> emit,
  // ) async {
  //   emit(state.copyWith(captchaLoading: true));

  //   // try {
  //   if (state.isCheckedReCaptcha == false) {
  //     // Get reCAPTCHA token
  //     String? token = await GRecaptchaV3.execute('submit');
  //     print("reCaptcha Token: $token");

  //     //   if (token != null) {
  //     //     // Verify the token
  //     //     final verificationResponse = await verifyRecaptchaToken(
  //     //       secret:
  //     //           '6LdadMQqAAAAAD3UxtP5MCqV0CtOuxwyf_FLCpcn', // Replace with your secret key
  //     //       token: token,
  //     //       // remoteIp: '123.123.123.123'  // Optional: Add if you want to verify IP
  //     //     );

  //     //     if (verificationResponse.success) {
  //     //       // Token verified successfully
  //     //       print("reCAPTCHA Score: ${verificationResponse.score}");
  //     //       print("reCAPTCHA Action: ${verificationResponse.action}");

  //     //       emit(state.copyWith(
  //     //         isCheckedReCaptcha: true,
  //     //         captchaLoading: false,
  //     //       ));
  //     //     } else {
  //     //       // Verification failed
  //     //       print(
  //     //           "reCAPTCHA Verification Failed: ${verificationResponse.errorMessage}");
  //     //       emit(state.copyWith(
  //     //         isCheckedReCaptcha: false,
  //     //         captchaLoading: false,
  //     //         errorMessage: verificationResponse.errorMessage,
  //     //       ));
  //     //     }
  //     //   } else {
  //     //     emit(state.copyWith(
  //     //       isCheckedReCaptcha: false,
  //     //       captchaLoading: false,
  //     //       errorMessage: 'Failed to get reCAPTCHA token',
  //     //     ));
  //     //   }
  //     // } else {
  //     //   emit(state.copyWith(
  //     //     isCheckedReCaptcha: false,
  //     //     captchaLoading: false,
  //     //   ));
  //     // }
  //     // } catch (e) {
  //     //   emit(state.copyWith(
  //     //     isCheckedReCaptcha: false,
  //     //     captchaLoading: false,
  //     //     errorMessage: 'reCAPTCHA Error: $e',
  //     //   ));
  //   }
  // }

  // // FutureOr<void> _getReCaptchaToken(
  // //   GetReCaptchaToken event,
  // //   Emitter<RegistrationState> emit,
  // // ) async {
  // //   emit(state.copyWith(captchaLoading: true));

  // //   if (state.isCheckedReCaptcha == false) {
  // //     String? token = await GRecaptchaV3.execute('submit');
  // //     print("reCaptcha Token: $token");

  // //     emit(state.copyWith(isCheckedReCaptcha: true, captchaLoading: false));
  // //   } else {
  // //     emit(state.copyWith(isCheckedReCaptcha: false, captchaLoading: false));
  // //   }
  // // }
  // Future<RecaptchaVerificationResponse> verifyRecaptchaToken({
  //   required String secret,
  //   required String token,
  //   String? remoteIp,
  // }) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://www.google.com/recaptcha/api/siteverify'),
  //       body: {
  //         'secret': secret,
  //         'response': token,
  //         if (remoteIp != null) 'remoteip': remoteIp,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       return RecaptchaVerificationResponse.fromJson(data);
  //     } else {
  //       return RecaptchaVerificationResponse(
  //         success: false,
  //         errorMessage: 'HTTP Error: ${response.statusCode}',
  //       );
  //     }
  //   } catch (e) {
  //     return RecaptchaVerificationResponse(
  //       success: false,
  //       errorMessage: 'Verification Error: $e',
  //     );
  //   }
  // }

  FutureOr<void> _checkLoginValidationEvent(
    CheckLoginValidationEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));
    final checkLoginIsValidResponse =
        await registrationRepository.checkLoginIsValid();
    emit(state.copyWith(initialApiStatus: ApiStatus.completed));
    checkLoginIsValidResponse.fold(
      (failure) {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.failure,
        ));
      },
      (result) {
        emit(
          state.copyWith(
            initialApiStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  FutureOr<void> checkboxStatusTCChange(
      CheckboxChangeTCEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(isCheckedTc: event.isChecked));
  }

  FutureOr<void> checkboxStatusMarketingConsentChange(
      CheckboxChangeMarketingConsentEvent event,
      Emitter<RegistrationState> emit) {
    emit(state.copyWith(isCheckedMarketingConsent: event.isChecked));
  }

  FutureOr<void> _cancelButtonClicked(
      CancelClicked event, Emitter<RegistrationState> emit) {
    if (state.selectedIndex == 9) {
      emit(
        state.copyWith(
          firstName: "",
          lastName: "",
          selectedIndex: Pages.login.value.toInt(),
          apiStatus: ApiStatus.initial,
          registrationSuccess: false,
          isCheckedTc: false,
          isCheckedMarketingConsent: false,
          errorMessage: "",
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedIndex: Pages.login.value.toInt(),
          apiStatus: ApiStatus.initial,
          errorMessage: "",
        ),
      );
    }
  }

  FutureOr<void> _nextRegistrationButtonClicked(
      NextRegistrationViewClicked event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        selectedIndex: Pages.login.value.toInt(),
        apiStatus: ApiStatus.initial,
      ),
    );
  }

  FutureOr<void> _showRegistrationView(
      ShowRegistrationEvent event, Emitter<RegistrationState> emit) {
    emit(
      state.copyWith(
        selectedIndex: Pages.registration.value.toInt(),
        apiStatus: ApiStatus.initial,
      ),
    );
  }

  FutureOr<void> _registrationValidation(
      RegistrationValidationEvent event, Emitter<RegistrationState> emit) {
    if (event.firstName.isEmpty) {
      customErrorSnackBar(
        event.buildContext,
        message: StringConst.pleaseProvideYourFirstName,
      );
    } else if (event.lastName.isEmpty) {
      customErrorSnackBar(
        event.buildContext,
        message: StringConst.pleaseProvideYourLastName,
      );
    } else if (state.email.isEmpty) {
      add(NextRegistrationViewClicked());
    } else {
      emit(state.copyWith(
        firstName: event.firstName,
        lastName: event.lastName,
      ));

      if (!state.isCheckedTc) {
        customErrorSnackBar(event.buildContext,
            message: StringConst.pleaseAcceptTermAndCondition);
      } else if (event.question1AnswerNo == 0) {
        customErrorSnackBar(event.buildContext,
            message: StringConst.questionError1);
      } else if (event.question2AnswerNo == 0) {
        customErrorSnackBar(event.buildContext,
            message: StringConst.questionError2);
      } else {
        add(
          RegisterWithEmailApiEvent(
            email: state.email,
            firstName: state.firstName,
            lastName: state.lastName,
            marketingConsent: state.isCheckedMarketingConsent ? 1 : 0,
          ),
        );
      }
    }
  }

  FutureOr<void> _emailValidation(
      EmailValidationEvent event, Emitter<RegistrationState> emit) {
    if (event.email.isEmpty || event.email.isValidEmail() == false) {
      customErrorSnackBar(
        event.buildContext,
        message: StringConst.pleaseProvideYourEmail,
      );
    }
    // else if (state.isCheckedReCaptcha == false) {
    //   customErrorSnackBar(
    //     event.buildContext,
    //     message: StringConst.pleaseCompleteTheCaptcha,
    //   );
    // }
    else {
      emit(state.copyWith(
        firstName: state.firstName,
        lastName: state.lastName,
        email: event.email,
        registrationSuccess: false,
      ));
      if (state.firstName.isNotEmpty && state.lastName.isNotEmpty) {
        add(
          RegisterWithEmailApiEvent(
            email: event.email,
            firstName: state.firstName,
            lastName: state.lastName,
            marketingConsent: state.isCheckedMarketingConsent ? 1 : 0,
          ),
        );
      } else {
        event.buildContext
            .read<EmailProvidingBloc>()
            .add(CheckMemberExists(event.email));
      }
    }
  }

  FutureOr<void> _otpValidation(
      OtpValidationEvent event, Emitter<RegistrationState> emit) {
    if (event.otp.isEmpty) {
      customErrorSnackBar(
        event.buildContext,
        message: "${StringConst.pleaseProvideTheOTP} ${state.email}",
      );
    } else {
      emit(state.copyWith(
        otp: event.otp,
      ));

      add(ConfirmOtpApiEvent(
        buildContext: event.buildContext,
        otp: event.otp,
        tempLoginToken: state.tempToken,
        isFromRegistrationPage: true,
      ));
    }
  }

  FutureOr<void> _loginWithEmailEvent(
      LoginWithEmailApiEvent event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    await GetStorage().remove(StringConst.isBookingSessionExistedKey);
    final loginResponse =
        await registrationRepository.loginWithEmail(userEmail: event.email);
    emit(state.copyWith(apiStatus: ApiStatus.completed));
    loginResponse.fold(
      (failure) {
        emit(state.copyWith(
          apiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (result) {
        emit(state.copyWith(
          firstName: "",
          lastName: "",
          selectedIndex: Pages.otp.value.toInt(),
          apiStatus: ApiStatus.success,
          tempToken: result.loginDetailsForOTP?.TempLoginToken,
        ));
      },
    );
  }

  FutureOr<void> _registerWithEmailEvent(
    RegisterWithEmailApiEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    final registerResponse = await registrationRepository.registerWithEmail(
      userEmail: event.email,
      userFirstName: event.firstName,
      userLastName: event.lastName,
      marketingConsent: event.marketingConsent,
    );
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
          firstName: "",
          lastName: "",
          selectedIndex: Pages.otp.value.toInt(),
          apiStatus: ApiStatus.success,
          registrationSuccess: true,
          tempToken: result.registrationDetailsForOTP?.TempLoginToken,
        ));
      },
    );
  }

  FutureOr<void> _confirmOtpEvent(
      ConfirmOtpApiEvent event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final registerResponse = await registrationRepository.confirmOtp(
      tempLoginToken: event.tempLoginToken,
      otp: event.otp,
    );

    registerResponse.fold(
      (failure) {
        emit(state.copyWith(apiStatus: ApiStatus.completed));
        emit(state.copyWith(
          apiStatus: ApiStatus.failure,
          errorMessage: failure.message,
          confirmOtpApi: true,
        ));
      },
      (result) async {
        emit(state.copyWith(apiStatus: ApiStatus.completed));

        emit(state.copyWith(
          apiStatus: ApiStatus.success,
          tempToken: result.loginDetails?.LoginToken,
          canNavigate: true,
          confirmOtpApi: false,
        ));
      },
    );
  }

  FutureOr<void> _setInitialValue(
      SetInitialEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      apiStatus: ApiStatus.initial,
      canNavigate: false,
      email: "",
      firstName: "",
      lastName: "",
      otp: "",
      registrationSuccess: false,
      selectedIndex: 8,
      tempToken: "",
    ));
  }
}
