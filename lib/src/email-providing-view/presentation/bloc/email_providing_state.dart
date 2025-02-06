part of 'email_providing_bloc.dart';

class EmailProvidingState extends Equatable {
  final ApiStatus apiStatus;
  final ApiStatus initialApiStatus;
  final String errorMessage;
  final String email;
  final EventInfoModel eventInfo;
  // final bool isCheckedReCaptcha;
  final bool captchaLoading;
  const EmailProvidingState({
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
    this.errorMessage = "",
    this.email = "",
    this.eventInfo = const EventInfoModel(),
    // this.isCheckedReCaptcha = false,
    this.captchaLoading = false,
  });

  @override
  List<Object> get props => [
        apiStatus,
        initialApiStatus,
        errorMessage,
        email,
        eventInfo,
        // isCheckedReCaptcha,
        captchaLoading,
      ];

  EmailProvidingState copyWith({
    ApiStatus? apiStatus,
    ApiStatus? initialApiStatus,
    String? errorMessage,
    String? email,
    EventInfoModel? eventInfo,
    // bool? isCheckedReCaptcha,
    bool? captchaLoading,
  }) {
    return EmailProvidingState(
      apiStatus: apiStatus ?? this.apiStatus,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      eventInfo: eventInfo ?? this.eventInfo,
      // isCheckedReCaptcha: isCheckedReCaptcha ?? this.isCheckedReCaptcha,
      captchaLoading: captchaLoading ?? this.captchaLoading,
    );
  }
}

final class EmailProvidingInitial extends EmailProvidingState {}

class CheckMemberExistsState extends EmailProvidingState {
  final bool memberExists;
  const CheckMemberExistsState({this.memberExists = false});
  @override
  List<Object> get props => [memberExists];
}

class CheckMemberIsActiveState extends EmailProvidingState {
  final bool memberIsActive;
  const CheckMemberIsActiveState({this.memberIsActive = false});
  @override
  List<Object> get props => [memberIsActive];
}

class ToggleTextExpandState extends EmailProvidingState {
  final bool isExpandedText;
  const ToggleTextExpandState({this.isExpandedText = false});
  @override
  List<Object> get props => [isExpandedText];
}
