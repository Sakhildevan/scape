part of 'otp_verification_bloc.dart';

class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent();

  @override
  List<Object> get props => [];
}

class ConfirmOtpEvent extends OtpVerificationEvent {
  final String otp;
  final BuildContext buildContext;
  const ConfirmOtpEvent(this.otp, this.buildContext);
  @override
  List<Object> get props => [
        otp,
        buildContext,
      ];
}

class ValidateOtpEvent extends OtpVerificationEvent {
  final String otp;
  final BuildContext buildContext;
  const ValidateOtpEvent(this.otp, this.buildContext);
  @override
  List<Object> get props => [
        otp,
        buildContext,
      ];
}

class StoreOtp extends OtpVerificationEvent {
  final String otp;
  const StoreOtp({
    this.otp = "",
  });

  @override
  List<Object> get props => [
        otp,
      ];
}

class StoreEmailTempToken extends OtpVerificationEvent {
  final String email;
  final String tempToken;
  const StoreEmailTempToken({
    this.email = "",
    this.tempToken = "",
  });

  @override
  List<Object> get props => [
        email,
        tempToken,
      ];
}

class OtVerificationResetEvent extends OtpVerificationEvent {}

class OtpNextBtnClicked extends OtpVerificationEvent {
  final BuildContext context;
  const OtpNextBtnClicked(this.context);
}

class CheckSingPassVerification extends OtpVerificationEvent {
  const CheckSingPassVerification();
}

class ShowOtpError extends OtpVerificationEvent {
  const ShowOtpError();
}

class MyProfileUpdateQuizEvent extends OtpVerificationEvent {
  final BuildContext context;
  final bool? navigateTicketBooking;
  const MyProfileUpdateQuizEvent({
    required this.context,
    this.navigateTicketBooking,
  });
}
