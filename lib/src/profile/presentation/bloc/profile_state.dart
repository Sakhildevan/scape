part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final ApiStatus initialApiStatus;
  final ApiStatus apiStatus;
  final List<Ticket> ticketList;
  final bool showTextField;
  final ProfileModel profile;
  final String errorMessage;
  final String editNameError;
  final String editEmailError;
  final String tempToken;
  final bool scroll;
  final bool isCheckedMarketingConsent;
  final GlobalKey? moreInterestSectionKey;
  final ScrollController? scrollController;
  final bool toggleInterest;
  final bool toggleConsent;
  const ProfileState({
    this.errorMessage = '',
    this.editNameError = '',
    this.editEmailError = '',
    this.tempToken = '',
    this.scroll = false,
    this.isCheckedMarketingConsent = false,
    this.showTextField = false,
    this.moreInterestSectionKey,
    this.scrollController,
    this.toggleConsent = true,
    this.toggleInterest = true,
    this.initialApiStatus = ApiStatus.initial,
    this.apiStatus = ApiStatus.initial,
    this.ticketList = const <Ticket>[],
    this.profile = const ProfileModel(),
  });

  @override
  List<Object> get props => [
        initialApiStatus,
        apiStatus,
        ticketList,
        errorMessage,
        tempToken,
        profile,
        scroll,
        isCheckedMarketingConsent,
        showTextField,
        editEmailError,
        editNameError,
        toggleConsent,
        toggleInterest,
      ];

  ProfileState copyWith({
    String? errorMessage,
    String? editNameError,
    String? editEmailError,
    String? tempToken,
    int? apiCheck,
    bool? scroll,
    bool? isCheckedMarketingConsent,
    bool? showTextField,
    bool? toggleInterest,
    bool? toggleConsent,
    GlobalKey? moreInterestSectionKey,
    ScrollController? scrollController,
    ApiStatus? initialApiStatus,
    ApiStatus? apiStatus,
    List<Ticket>? ticketList,
    ProfileModel? profile,
  }) {
    return ProfileState(
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      scroll: scroll ?? this.scroll,
      isCheckedMarketingConsent:
          isCheckedMarketingConsent ?? this.isCheckedMarketingConsent,
      moreInterestSectionKey:
          moreInterestSectionKey ?? this.moreInterestSectionKey,
      scrollController: scrollController ?? this.scrollController,
      showTextField: showTextField ?? this.showTextField,
      apiStatus: apiStatus ?? this.apiStatus,
      ticketList: ticketList ?? this.ticketList,
      errorMessage: errorMessage ?? this.errorMessage,
      tempToken: tempToken ?? this.tempToken,
      profile: profile ?? this.profile,
      editNameError: editNameError ?? this.editNameError,
      editEmailError: editEmailError ?? this.editEmailError,
      toggleInterest: toggleInterest ?? this.toggleInterest,
      toggleConsent: toggleConsent ?? this.toggleConsent,
    );
  }
}

class LoginValidState extends ProfileState {}
