part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final int selectedIndex;
  final int marketingConsent;
  final String firstName;
  final String lastName;
  final String email;
  final String otp;
  final String tempToken;
  final ApiStatus apiStatus;
  final String errorMessage;
  final bool canNavigate;
  final bool confirmOtpApi;
  final bool isCheckedTc;
  final bool isCheckedMarketingConsent;
  final bool registrationSuccess;
  // final bool isCheckedReCaptcha;
  final bool captchaLoading;
  final ApiStatus initialApiStatus;

  const RegistrationState({
    this.selectedIndex = 8,
    this.marketingConsent = 0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.otp = '',
    this.tempToken = '',
    this.errorMessage = '',
    this.confirmOtpApi = false,
    this.canNavigate = false,
    this.registrationSuccess = false,
    this.isCheckedTc = true,
    this.isCheckedMarketingConsent = true,
    // this.isCheckedReCaptcha = false,
    this.captchaLoading = false,
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
  });

  @override
  List<Object?> get props => [
        selectedIndex,
        marketingConsent,
        firstName,
        lastName,
        email,
        otp,
        tempToken,
        errorMessage,
        apiStatus,
        confirmOtpApi,
        canNavigate,
        isCheckedTc,
        isCheckedMarketingConsent,
        registrationSuccess,
        initialApiStatus,
        // isCheckedReCaptcha,
        captchaLoading,
      ];

  RegistrationState copyWith({
    int? selectedIndex,
    int? marketingConsent,
    String? firstName,
    String? lastName,
    String? email,
    String? otp,
    String? tempToken,
    String? errorMessage,
    bool? confirmOtpApi,
    bool? canNavigate,
    bool? registrationSuccess,
    bool? isCheckedTc,
    bool? isCheckedMarketingConsent,
    // bool? isCheckedReCaptcha,
    bool? captchaLoading,
    ApiStatus? apiStatus,
    ApiStatus? initialApiStatus,
  }) {
    return RegistrationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      marketingConsent: marketingConsent ?? this.marketingConsent,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      otp: otp ?? this.otp,
      tempToken: tempToken ?? this.tempToken,
      errorMessage: errorMessage ?? this.errorMessage,
      confirmOtpApi: confirmOtpApi ?? this.confirmOtpApi,
      canNavigate: canNavigate ?? this.canNavigate,
      registrationSuccess: registrationSuccess ?? this.registrationSuccess,
      isCheckedTc: isCheckedTc ?? this.isCheckedTc,
      isCheckedMarketingConsent:
          isCheckedMarketingConsent ?? this.isCheckedMarketingConsent,
      apiStatus: apiStatus ?? this.apiStatus,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      // isCheckedReCaptcha: isCheckedReCaptcha ?? this.isCheckedReCaptcha,
      captchaLoading: captchaLoading ?? this.captchaLoading,
    );
  }
}

final class RegistrationInitial extends RegistrationState {}
