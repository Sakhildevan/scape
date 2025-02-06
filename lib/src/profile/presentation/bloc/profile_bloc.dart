import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/common_widgets/popup_message_widget.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/profile/data/repository/profile_repository.dart';

import '../../data/model/my_tickets_model/my_tickets_model.dart';
import '../../data/model/profile_model/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({required this.profileRepository}) : super(const ProfileState()) {
    on<ProfileCheckboxMarketingConsentEvent>(updateMarketingConsent);
    on<CheckLoginIsValidEvent>(_checkLoginIsValid);
    on<FetchTicketList>(_fetchTicketDetails);
    on<FetchProfileDetails>(_fetchProfileDetails);
    on<EditProfileName>(_editProfileName);
    on<EditProfileEmail>(_editProfileEmail);
    on<ConfirmOtpForEmail>(_confirmOtpForEmail);
    on<ShowTextField>(_showTextField);
    on<ShowMore>(_showMore);
    on<ResetEditProfileError>(_resetEditProfile);
    on<ToggleInformationEvent>(_toggleInformation);
    on<UpdateMyInterestEvent>(_updateMyInterest);
    on<AddMoreInterestEvent>(_addMoreInterestEvent);
    on<DeleteMoreInterestEvent>(_deleteMoreInterestEvent);
  }

  FutureOr<void> _checkLoginIsValid(
    CheckLoginIsValidEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));
    final checkLoginIsValidResponse =
        await profileRepository.checkLoginIsValid();
    emit(state.copyWith(initialApiStatus: ApiStatus.completed));
    checkLoginIsValidResponse.fold(
      (failure) {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.failure,
        ));
      },
      (result) {
        emit(LoginValidState());
        emit(
          state.copyWith(
            initialApiStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _fetchTicketDetails(
      FetchTicketList event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
      apiStatus: ApiStatus.loading,
    ));
    final response = await profileRepository.getMyTickets();
    emit(state.copyWith(apiStatus: ApiStatus.completed));
    response.fold((failure) {
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (tickets) {
      emit(state.copyWith(
        ticketList: tickets.tickets,
      ));
      add(const FetchProfileDetails(initialCall: true));
    });
  }

  Future<void> _fetchProfileDetails(
      FetchProfileDetails event, Emitter<ProfileState> emit) async {
    await _updateProfileDetails(event, emit, event.initialCall ?? false);
  }

  Future<void> _updateProfileDetails(
    FetchProfileDetails event,
    Emitter<ProfileState> emit,
    bool initialLoading,
  ) async {
    try {
      if (initialLoading) {
        emit(state.copyWith(apiStatus: ApiStatus.loading));
      } else if (event.context != null) {
        popupLoading(event.context!);
      }

      final response = await profileRepository.getProfileData();

      if (!emit.isDone) {
        // Check if we can still emit
        if (!initialLoading && event.context != null) {
          event.context!.pop();
        }

        await response.fold(
          (failure) async {
            if (initialLoading) {
              emit(state.copyWith(
                apiStatus: ApiStatus.failure,
                errorMessage: failure.message,
              ));
            } else if (event.context != null) {
              popupMessageWidget(event.context!, failure.message);
            }
          },
          (profile) async {
            if (!initialLoading &&
                event.context != null &&
                event.emailUpdated == true) {
              event.context!.pop();
            }
            ProfileState newState = state;
            if (initialLoading) {
              newState = state.copyWith(
                profile: profile,
                isCheckedMarketingConsent:
                    (profile.marketingConsent ?? 0) == 1 ? true : false,
                apiStatus: ApiStatus.success,
              );
            } else if (event.context != null) {
              newState = state.copyWith(
                profile: profile,
                isCheckedMarketingConsent:
                    (profile.marketingConsent ?? 0) == 1 ? true : false,
              );
            }
            if (!emit.isDone) {
              // Double check before final emit
              emit(newState);
            }
          },
        );
      }
    } catch (e) {
      print(e.toString());
      if (!emit.isDone) {
        emit(state.copyWith(
          apiStatus: ApiStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    }
  }

  Future<void> _editProfileName(
      EditProfileName event, Emitter<ProfileState> emit) async {
    if (event.firstName.isNotEmpty && event.lastName.isNotEmpty) {
      popupLoading(event.context);
      final response =
          await profileRepository.editName(event.firstName, event.lastName);
      if (event.context.mounted) {
        event.context.pop();
      }
      response.fold(
        (failure) {
          popupMessageWidget(event.context, failure.message);
        },
        (result) {
          if (event.context.mounted) {
            emit(
              state.copyWith(editNameError: ""),
            );
            //Pop the edit name dialog
            event.context.pop();
          }
          add(FetchProfileDetails(
            initialCall: false,
            context: event.context,
          ));
        },
      );
    } else {
      emit(state.copyWith(
          editNameError: 'Please provide both first name and last name'));
    }
  }

  void _showMore(ShowMore event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(scroll: !state.scroll));
  }

  void _showTextField(ShowTextField event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(showTextField: !state.showTextField));
  }

  FutureOr<void> _editProfileEmail(
      EditProfileEmail event, Emitter<ProfileState> emit) async {
    if (event.email.isNotEmpty && event.email.isValidEmail()) {
      popupLoading(event.context);
      final response = await profileRepository.editEmail(
        event.email,
      );
      if (event.context.mounted) {
        event.context.pop();
      }
      response.fold(
        (failure) {
          popupMessageWidget(event.context, failure.message);
        },
        (result) {
          if (event.context.mounted) {
            //Pop the edit email dialog
            event.context.pop();
          }
          emit(state.copyWith(
            tempToken: result.TempToken ?? "",
            editEmailError: "",
          ));
          popUpConfirmOtp(
            event.context,
            StringConst.confirmYourEmail,
          );
        },
      );
    } else {
      emit(state.copyWith(editEmailError: StringConst.pleaseProvideValidEmail));
    }
  }

  FutureOr<void> _confirmOtpForEmail(
      ConfirmOtpForEmail event, Emitter<ProfileState> emit) async {
    if (event.otp.isNotEmpty) {
      popupLoading(event.context);
      final response = await profileRepository.updateEmailFinalize(
        state.tempToken,
        event.otp,
      );
      if (event.context.mounted) {
        event.context.pop();
      }
      response.fold(
        (failure) {
          popupMessageWidget(event.context, failure.message);
        },
        (result) {
          // if (event.context.mounted) {
          //   //Pop the edit email dialog
          //   event.context.pop();
          // }
          add(FetchProfileDetails(
            initialCall: false,
            emailUpdated: true,
            context: event.context,
          ));
        },
      );
    } else {
      emit(state.copyWith(errorMessage: StringConst.pleaseProvideValidEmail));
    }
  }

  FutureOr<void> updateMarketingConsent(
      ProfileCheckboxMarketingConsentEvent event,
      Emitter<ProfileState> emit) async {
    popupLoading(event.context);
    final response = await profileRepository
        .updateMyProfileMarketingConsent(event.marketingConsent);
    if (event.context.mounted) {
      event.context.pop();
    }
    response.fold(
      (failure) {
        popupMessageWidget(event.context, failure.message);
      },
      (result) {
        if (event.marketingConsent == 1) {
          emit(state.copyWith(isCheckedMarketingConsent: true));
        } else {
          emit(state.copyWith(isCheckedMarketingConsent: false));
        }
      },
    );
  }

  FutureOr<void> _resetEditProfile(
      ResetEditProfileError event, Emitter<ProfileState> emit) {
    emit(
      state.copyWith(
        editEmailError: "",
        editNameError: "",
      ),
    );
  }

  FutureOr<void> _toggleInformation(
      ToggleInformationEvent event, Emitter<ProfileState> emit) {
    if (event.isMyInterest == true) {
      emit(state.copyWith(toggleInterest: !state.toggleInterest));
    } else {
      emit(state.copyWith(toggleConsent: !state.toggleConsent));
    }
  }

  FutureOr<void> _updateMyInterest(
      UpdateMyInterestEvent event, Emitter<ProfileState> emit) async {
    popupLoading(event.context);
    final response = await profileRepository.myInterestUpdateStatus(
      event.interestCode,
      event.status,
    );
    if (event.context.mounted) {
      event.context.pop();
    }
    response.fold(
      (failure) {
        popupMessageWidget(event.context, failure.message);
      },
      (result) {
        List<Interest> interestList = List.from(state.profile.interests ?? []);

        // Find index of interest to update
        int index = interestList
            .indexWhere((item) => item.interestCode == event.interestCode);

        if (index > -1) {
          Interest updatedInterest = interestList[index].copyWith(
            isSelected: interestList[index].isSelected == StringConst.yesKey
                ? StringConst.noKey
                : StringConst.yesKey,
          );

          interestList[index] = updatedInterest;

          emit(
            state.copyWith(
              profile: state.profile.copyWith(interests: interestList),
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _addMoreInterestEvent(
      AddMoreInterestEvent event, Emitter<ProfileState> emit) async {
    if (event.moreInterestName.text.isNotEmpty) {
      popupLoading(event.context);
      final response = await profileRepository.myProfileAddMoreInterest(
        event.moreInterestName.text,
      );
      if (event.context.mounted) {
        event.context.pop();
      }
      response.fold(
        (failure) {
          popupMessageWidget(event.context, failure.message);
        },
        (result) {
          event.moreInterestName.text = "";
          add(FetchProfileDetails(
            initialCall: false,
            context: event.context,
          ));
        },
      );
    }
  }

  FutureOr<void> _deleteMoreInterestEvent(
      DeleteMoreInterestEvent event, Emitter<ProfileState> emit) async {
    popupLoading(event.context);
    final response = await profileRepository.myProfileDeleteMoreInterest(
      event.moreInterestCode,
    );
    if (event.context.mounted) {
      event.context.pop();
    }
    response.fold(
      (failure) {
        popupMessageWidget(event.context, failure.message);
      },
      (result) {
        List<MoreInterest> moreInterestList =
            List.from(state.profile.moreInterests ?? []);

        // Find index of moreInterest to update
        int index = moreInterestList.indexWhere(
            (item) => item.moreInterestCode == event.moreInterestCode);

        if (index > -1) {
          moreInterestList.removeAt(index);

          emit(
            state.copyWith(
              profile: state.profile.copyWith(moreInterests: moreInterestList),
            ),
          );
        }
      },
    );
  }
}
