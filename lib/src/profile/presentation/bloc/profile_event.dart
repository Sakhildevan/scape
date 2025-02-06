part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchTicketList extends ProfileEvent {
  const FetchTicketList();

  @override
  List<Object> get props => [];
}

class FetchProfileDetails extends ProfileEvent {
  const FetchProfileDetails({
    required this.initialCall,
    this.context,
    this.emailUpdated,
  });
  final bool initialCall;
  final bool? emailUpdated;
  final BuildContext? context;

  @override
  List<Object> get props => [];
}

class ProfileCheckboxMarketingConsentEvent extends ProfileEvent {
  final int marketingConsent;
  final BuildContext context;

  const ProfileCheckboxMarketingConsentEvent(
      this.marketingConsent, this.context);

  @override
  List<Object> get props => [marketingConsent, context];
}

class EditProfileName extends ProfileEvent {
  final String firstName;
  final String lastName;
  final BuildContext context;

  const EditProfileName(
    this.firstName,
    this.lastName,
    this.context,
  );

  @override
  List<Object> get props => [firstName, lastName, context];
}

class EditProfileEmail extends ProfileEvent {
  final String email;
  final BuildContext context;
  const EditProfileEmail(
    this.email,
    this.context,
  );

  @override
  List<Object> get props => [email, context];
}

class ConfirmOtpForEmail extends ProfileEvent {
  final String otp;
  final BuildContext context;
  const ConfirmOtpForEmail(
    this.otp,
    this.context,
  );

  @override
  List<Object> get props => [otp, context];
}

class APICallEvent extends ProfileEvent {}

class CheckLoginIsValidEvent extends ProfileEvent {}

class CheckLoginForTicket extends ProfileEvent {
  final BuildContext context;
  const CheckLoginForTicket(this.context);
}

class ShowMore extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ResetEditProfileError extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ShowTextField extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class LoginValidEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ToggleInformationEvent extends ProfileEvent {
  final bool isMyInterest;
  const ToggleInformationEvent(this.isMyInterest);
  @override
  List<Object> get props => [isMyInterest];
}

class UpdateMyInterestEvent extends ProfileEvent {
  final String interestCode;
  final String status;
  final BuildContext context;
  const UpdateMyInterestEvent(this.context, this.interestCode, this.status);

  @override
  List<Object> get props => [context, interestCode, status];
}

class AddMoreInterestEvent extends ProfileEvent {
  final TextEditingController moreInterestName;
  final BuildContext context;
  const AddMoreInterestEvent(
    this.context,
    this.moreInterestName,
  );

  @override
  List<Object> get props => [
        context,
        moreInterestName,
      ];
}

class DeleteMoreInterestEvent extends ProfileEvent {
  final String moreInterestCode;
  final BuildContext context;
  const DeleteMoreInterestEvent(
    this.context,
    this.moreInterestCode,
  );

  @override
  List<Object> get props => [
        context,
        moreInterestCode,
      ];
}
