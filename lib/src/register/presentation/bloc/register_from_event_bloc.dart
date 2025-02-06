import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_event.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_state.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';

class RegisterFromEventBloc
    extends Bloc<RegisterFromEventEvent, RegisterFromEventState> {
  RegisterFromEventBloc() : super(const RegisterFromEventState()) {
    on<RegisterFromEventCheckboxMarketingConsentEvent>(
        checkboxStatusMarketingConsentChange);
    on<RegisterFromEventValidationEvent>(_registrationValidation);

    on<StoreEmail>(_storeEmail);

    on<RegisterFromEventNextBtn>(_registerFromEventNextBtn);
    on<CheckboxChangeEvent>(checkboxStatusChange);

    on<RegisterFromEventResetEvent>(_resettingTheState);
    on<SetQuestionAnswer>(_setQuestionAnswer);
  }
  FutureOr<void> checkboxStatusMarketingConsentChange(
      RegisterFromEventCheckboxMarketingConsentEvent event,
      Emitter<RegisterFromEventState> emit) {
    emit(state.copyWith(isCheckedMarketingConsent: event.isChecked));
  }

  FutureOr<void> _resettingTheState(
    RegisterFromEventResetEvent event,
    Emitter<RegisterFromEventState> emit,
  ) {
    emit(state.copyWith(
      apiStatus: ApiStatus.initial,
      email: null,
      firstName: "",
      lastName: "",
      isCheckedMarketingConsent: true,
      isChecked: true,
      question1AnswerNo: 0,
      question2AnswerNo: 0,
    ));
  }

  FutureOr<void> _storeEmail(
      StoreEmail event, Emitter<RegisterFromEventState> emit) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  FutureOr<void> _registrationValidation(RegisterFromEventValidationEvent event,
      Emitter<RegisterFromEventState> emit) {
    // if (event.firstName.isEmpty) {
    //   customErrorSnackBar(
    //     event.buildContext,
    //     message: StringConst.enterYourFirstName,
    //   );
    // } else if (event.lastName.isEmpty) {
    //   customErrorSnackBar(
    //     event.buildContext,
    //     message: StringConst.enterYourLastName,
    //   );
    // } else {
    // add(const CheckboxChangeEvent(true));
    emit(state.copyWith(
      firstName: event.firstName,
      lastName: event.lastName,
    ));
    // }
  }

  FutureOr<void> checkboxStatusChange(
      CheckboxChangeEvent event, Emitter<RegisterFromEventState> emit) {
    emit(state.copyWith(isChecked: event.isChecked));
  }

  FutureOr<void> _registerFromEventNextBtn(
      RegisterFromEventNextBtn event, Emitter<RegisterFromEventState> emit) {
    if (state.isChecked &&
        state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.question1AnswerNo != 0 &&
        state.question2AnswerNo != 0) {
      event.context.read<RegistrationBloc>().add(RegisterWithEmailApiEvent(
            email: state.email,
            firstName: state.firstName,
            lastName: state.lastName,
            marketingConsent: state.isCheckedMarketingConsent ? 1 : 0,
          ));
    } else if (state.firstName.isEmpty) {
      customErrorSnackBar(event.context,
          message: StringConst.pleaseProvideYourFirstName);
    } else if (state.lastName.isEmpty) {
      customErrorSnackBar(event.context,
          message: StringConst.pleaseProvideYourLastName);
    } else if (!state.isChecked &&
        state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty) {
      customErrorSnackBar(event.context,
          message: StringConst.pleaseAcceptTermAndCondition);
    } else if (state.isChecked &&
        state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.question1AnswerNo == 0) {
      customErrorSnackBar(event.context, message: StringConst.questionError1);
    } else if (state.isChecked &&
        state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.question2AnswerNo == 0) {
      customErrorSnackBar(event.context, message: StringConst.questionError2);
    }
  }

  FutureOr<void> _setQuestionAnswer(
      SetQuestionAnswer event, Emitter<RegisterFromEventState> emit) async {
    if (event.questionNo == 1) {
      await GetStorage().write(StringConst.wayToSuccessfulKey, event.item);
      emit(state.copyWith(question1AnswerNo: event.item));
    } else {
      await GetStorage().write(StringConst.findOpportunitiesKey, event.item);
      emit(state.copyWith(question2AnswerNo: event.item));
    }
  }
}
