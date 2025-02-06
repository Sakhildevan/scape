import 'dart:async';
// ignore: unused_import
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/data/repository/email_providing_repository.dart';

part 'email_providing_event.dart';
part 'email_providing_state.dart';

class EmailProvidingBloc
    extends Bloc<EmailProvidingEvent, EmailProvidingState> {
  final EmailProvidingRepository emailProvidingRepository;
  EmailProvidingBloc({required this.emailProvidingRepository})
      : super(EmailProvidingInitial()) {
    on<GetEventInformation>(_getEvent);
    on<EmailValidation>(_emailValidation);
    on<CheckMemberExists>(_checkMemberExists);
    on<CheckMemberIsActive>(_checkMemberIsActive);
    on<EmailProvidingNextBtnClicked>(_nextBtnClicked);
    on<ToggleTextExpandEvent>(_toggleTextExpand);
    on<SetInitialStatus>(_setInitialStatus);
    // on<GetReCaptchaTokenEvent>(_getReCaptchaToken);
  }

  // FutureOr<void> _getReCaptchaToken(
  //   GetReCaptchaTokenEvent event,
  //   Emitter<EmailProvidingState> emit,
  // ) async {
  //   emit(state.copyWith(captchaLoading: true));
  //   if (state.isCheckedReCaptcha == false) {
  //     String? token = await GRecaptchaV3.execute('submit');
  //     print(token);

  //     emit(state.copyWith(isCheckedReCaptcha: true, captchaLoading: false));
  //   } else {
  //     emit(state.copyWith(isCheckedReCaptcha: false, captchaLoading: false));
  //   }
  // }

  FutureOr<void> _getEvent(
    GetEventInformation event,
    Emitter<EmailProvidingState> emit,
  ) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));
    final result = await emailProvidingRepository.getEvent();
    result.fold(
      (failure) {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (eventInfo) => emit(state.copyWith(
        initialApiStatus: ApiStatus.success,
        eventInfo: eventInfo,
      )),
    );
  }

  FutureOr<void> _checkMemberExists(
    CheckMemberExists event,
    Emitter<EmailProvidingState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading, email: event.email));
    final result =
        await emailProvidingRepository.checkMemberExists(event.email);
    emit(state.copyWith(apiStatus: ApiStatus.completed));
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            apiStatus: ApiStatus.failure,
            errorMessage: failure.message,
          ),
        );
        // emit(const CheckMemberExistsState());
      },
      (data) => emit(CheckMemberExistsState(
        memberExists: data.IsMemberExists == StringConst.yesKey,
      )),
    );
  }

  FutureOr<void> _checkMemberIsActive(
    CheckMemberIsActive event,
    Emitter<EmailProvidingState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final result =
        await emailProvidingRepository.checkMemberIsActive(event.email);
    emit(state.copyWith(apiStatus: ApiStatus.completed));
    result.fold(
      (failure) => emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      )),
      (data) {
        emit(CheckMemberIsActiveState(
          memberIsActive: data.IsSuccess == StringConst.yesKey,
        ));
      },
    );
  }

  FutureOr<void> _emailValidation(
    EmailValidation event,
    Emitter<EmailProvidingState> emit,
  ) {
    if (event.email.isEmpty || event.email.isValidEmail() == false) {
      customErrorSnackBar(event.context,
          message: StringConst.pleaseProvideValidEmail);
    }
    // else if (state.isCheckedReCaptcha == false) {
    //   customErrorSnackBar(
    //     event.context,
    //     message: StringConst.pleaseCompleteTheCaptcha,
    //   );
    // }
    else {
      add(
        CheckMemberExists(event.email.toString()),
      );
    }
  }

  FutureOr<void> _nextBtnClicked(
      EmailProvidingNextBtnClicked event, Emitter<EmailProvidingState> emit) {
    add(EmailValidation(email: event.email, context: event.context));
  }

  FutureOr<void> _toggleTextExpand(
      ToggleTextExpandEvent event, Emitter<EmailProvidingState> emit) {
    emit(ToggleTextExpandState(isExpandedText: !event.currentValue));
  }

  FutureOr<void> _setInitialStatus(
      SetInitialStatus event, Emitter<EmailProvidingState> emit) {
    emit(state.copyWith(initialApiStatus: ApiStatus.initial));
  }
}
