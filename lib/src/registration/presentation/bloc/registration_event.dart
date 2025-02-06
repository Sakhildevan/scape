part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class NextBtnClicked extends RegistrationEvent {}

class CancelClicked extends RegistrationEvent {}

class ShowRegistrationEvent extends RegistrationEvent {}

class NextRegistrationViewClicked extends RegistrationEvent {}

class RegistrationValidationEvent extends RegistrationEvent {
  final String firstName;
  final String lastName;
  final int question1AnswerNo;
  final int question2AnswerNo;
  final BuildContext buildContext;

  const RegistrationValidationEvent({
    required this.firstName,
    required this.lastName,
    required this.buildContext,
    required this.question1AnswerNo,
    required this.question2AnswerNo,
  });
}

class EmailValidationEvent extends RegistrationEvent {
  final String email;
  final BuildContext buildContext;

  const EmailValidationEvent({required this.email, required this.buildContext});
}

class CheckboxChangeTCEvent extends RegistrationEvent {
  final bool isChecked;

  const CheckboxChangeTCEvent(this.isChecked);

  @override
  List<Object> get props => [isChecked];
}

class CheckboxChangeMarketingConsentEvent extends RegistrationEvent {
  final bool isChecked;

  const CheckboxChangeMarketingConsentEvent(this.isChecked);

  @override
  List<Object> get props => [isChecked];
}

class OtpValidationEvent extends RegistrationEvent {
  final String otp;
  final String tempLoginToken;
  final BuildContext buildContext;

  const OtpValidationEvent(
      {required this.otp,
      required this.buildContext,
      required this.tempLoginToken});
}

class LoginWithEmailApiEvent extends RegistrationEvent {
  final String email;

  const LoginWithEmailApiEvent({required this.email});
}

class CheckLoginValidationEvent extends RegistrationEvent {
  const CheckLoginValidationEvent();
}

class SetInitialEvent extends RegistrationEvent {
  const SetInitialEvent();
}

class GetReCaptchaToken extends RegistrationEvent {
  const GetReCaptchaToken();
}

class RegisterWithEmailApiEvent extends RegistrationEvent {
  final String email;
  final String firstName;
  final String lastName;
  final int marketingConsent;

  const RegisterWithEmailApiEvent({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.marketingConsent,
  });
}

class ConfirmOtpApiEvent extends RegistrationEvent {
  final String tempLoginToken;
  final String otp;
  final BuildContext buildContext;
  final bool isFromRegistrationPage;

  const ConfirmOtpApiEvent({
    required this.tempLoginToken,
    required this.otp,
    required this.buildContext,
    required this.isFromRegistrationPage,
  });
}
