part of 'email_providing_bloc.dart';

sealed class EmailProvidingEvent extends Equatable {
  const EmailProvidingEvent();

  @override
  List<Object> get props => [];
}

class GetEventInformation extends EmailProvidingEvent {
  const GetEventInformation();

  @override
  List<Object> get props => [];
}

class SetInitialStatus extends EmailProvidingEvent {
  const SetInitialStatus();

  @override
  List<Object> get props => [];
}

class GetReCaptchaTokenEvent extends EmailProvidingEvent {
  const GetReCaptchaTokenEvent();

  @override
  List<Object> get props => [];
}

class EmailValidation extends EmailProvidingEvent {
  final BuildContext context;
  final String email;

  const EmailValidation({
    required this.email,
    required this.context,
  });
  @override
  List<Object> get props => [email];
}

class CheckMemberExists extends EmailProvidingEvent {
  final String email;

  const CheckMemberExists(this.email);
  @override
  List<Object> get props => [email];
}

class CheckMemberIsActive extends EmailProvidingEvent {
  final String email;

  const CheckMemberIsActive(this.email);
  @override
  List<Object> get props => [email];
}

class EmailProvidingNextBtnClicked extends EmailProvidingEvent {
  final BuildContext context;
  final String email;
  const EmailProvidingNextBtnClicked(
      {required this.context, required this.email});
}

class ToggleTextExpandEvent extends EmailProvidingEvent {
  final bool currentValue;
  const ToggleTextExpandEvent(this.currentValue);
  @override
  List<Object> get props => [currentValue];
}
