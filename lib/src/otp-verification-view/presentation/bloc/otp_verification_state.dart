part of 'otp_verification_bloc.dart';

class OtpVerificationState extends Equatable {
  final String email;
  final String tempToken;
  final String otp;
  final ApiStatus apiStatus;
  final ApiStatus initialApiStatus;
  final String errorMessage;
  final bool otpError;
  const OtpVerificationState({
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
    this.email = '',
    this.tempToken = '',
    this.otp = '',
    this.otpError = false,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [
        apiStatus,
        errorMessage,
        email,
        tempToken,
        otp,
        otpError,
        initialApiStatus,
      ];

  OtpVerificationState copyWith({
    ApiStatus? apiStatus,
    ApiStatus? initialApiStatus,
    String? errorMessage,
    String? email,
    String? tempToken,
    String? otp,
    bool? otpError,
  }) {
    return OtpVerificationState(
      apiStatus: apiStatus ?? this.apiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      tempToken: tempToken ?? this.tempToken,
      otp: otp ?? this.otp,
      otpError: otpError ?? this.otpError,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
    );
  }
}

final class OtpVerificationStateInitial extends OtpVerificationState {}
