import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/src/profile/data/repository/profile_repository.dart';
import 'package:scape/src/ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';
import 'package:scape/src/ticket_booking/data/model/get_event_with_package_limit/get_event_with_package_limit_model.dart';
import 'package:scape/src/ticket_booking/data/model/tickets_participant_list_model/tickets_participant_list_model.dart';
import 'package:scape/src/ticket_booking/data/repository/ticket_booking_repository.dart';

import '../../../../core/utils/common_widgets/custom_snackbar.dart';
import '../../../../core/utils/string_constants.dart';

part 'ticket_booking_event.dart';

part 'ticket_booking_state.dart';

class TicketBookingBloc extends Bloc<TicketBookingEvent, TicketBookingState> {
  final TicketBookingRepository repository;
  final ProfileRepository profileRepository;

  TicketBookingBloc({
    required this.repository,
    required this.profileRepository,
  }) : super(const TicketBookingState()) {
    on<TicketBookingEvent>((event, emit) {});
    on<TicketBookingNextBtnClicked>(_ticketBookingNextBtn);
    on<CheckIsSessionCreatedEvent>(_checkIsSessionExisted);
    on<CheckIsSessionCreatedUpdateEvent>(_checkIsSessionCreatedUpdateEvent);
    on<CreateSessionDirectly>(_createSessionDirectly);
    on<GetBookingSessionInformation>(_getBookingSessionInformation);
    on<GetUpdatedBookingSessionEvent>(_getUpdateBookingSessionInformation);
    on<NavigateConfirmBooking>(_confirmBooking);
    on<UpdateTicketQty>(_updateTicketQty);
    on<CreateInitialQtyList>(_createInitialQtyList);
    on<CreateQtyList>(_createQtyList);
    on<InitializeParticipantsController>(_initializeParticipantsController);
    // on<CreateParticipantList>(_createParticipantList);
    on<AddMultipleTicketInitial>(_addMultipleTicketInitial);
    on<GetEventInfoWithLimit>(_getEventInfoWithLimit);
    on<GetUpdatedEventInfoWithLimit>(_getUpdatedEventInfoWithLimit);
    on<AddEmptyParticipant>(_addEmptyParticipant);
    on<DeleteParticipant>(_deleteParticipant);
    on<PackageParticipantUpdateEvent>(_packageParticipantUpdateEvent);
    on<CheckAllParticipantUpdatedEvent>(_checkAllParticipantUpdatedEvent);
    on<BackToParticipantAddPage>(_backToParticipantAddPage);
    on<BackToQuantityAddPage>(_backToQuantityAddPage);
    on<ConfirmFreeBooking>(_confirmFreeBooking);
  }

  FutureOr<void> _checkIsSessionExisted(CheckIsSessionCreatedEvent event,
      Emitter<TicketBookingState> emit) async {
    final bookingSession =
        await GetStorage().read(StringConst.isBookingSessionExistedKey);
    if (event.context.mounted) {
      if (bookingSession != null) {
        add(GetBookingSessionInformation(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
          participantAdded: event.participantAdded,
        ));
      } else {
        add(CreateSessionDirectly(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
        ));
      }
    }
  }

  FutureOr<void> _createSessionDirectly(
      CreateSessionDirectly event, Emitter<TicketBookingState> emit) async {
    emit(state.copyWith(
      initialApiStatus: ApiStatus.loading,
    ));

    final response = await repository.createBookingSessionDirectly();

    response.fold((failure) async {
      emit(state.copyWith(
        initialApiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (result) async {
      await GetStorage().write(StringConst.isBookingSessionExistedKey,
          result.bookingSessionDetails?.BookingSession ?? '');
      if (event.context.mounted) {
        add(GetBookingSessionInformation(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
        ));
      }
    });
  }

  int getPackageIndex(int ticketIndex) {
    // print(ticketIndex);
    return state.bookedPackages!.indexWhere(
      (item) =>
          item.EventPackageCode ==
          state.eventInfoWithLimit!.eventSettings!.EventPackages![ticketIndex]
              .EventPackageCode,
    );
  }

  FutureOr<void> _getBookingSessionInformation(
      GetBookingSessionInformation event,
      Emitter<TicketBookingState> emit) async {
    emit(state.copyWith(
      initialApiStatus: ApiStatus.loading,
    ));
    final response = await repository.bookingSessionDetailApi();

    response.fold((failure) async {
      if (failure.message == StringConst.userNotMatchedError) {
        add(CreateSessionDirectly(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
        ));
      } else {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      }
    }, (result) async {
      //For updating participant data after adding 1st participant------------
      List<List<TextEditingController>> nameControllers =
          List.from(state.nameControllers);
      List<List<TextEditingController>> emailControllers =
          List.from(state.emailControllers);
      //------------------------------

      //
      List<BookedPackage> bookedPackages = [];
      if (state.eventInfoWithLimit?.eventSettings?.EventPackages == null) {
        bookedPackages = result.bookingSessionDeatils?.BookedPackages ?? [];
        emit(state.copyWith(bookedPackages: bookedPackages));
      } else {
        // Sort bookedPackages according to EventPackages order

        // Create a map of EventPackageCode to index based on EventPackages order
        final packageOrder = Map.fromEntries(
          state.eventInfoWithLimit!.eventSettings!.EventPackages!
              .asMap()
              .entries
              .map(
                (entry) =>
                    MapEntry(entry.value.EventPackageCode ?? '', entry.key),
              ),
        );

        // Create a new sorted list of bookedPackages
        List<BookedPackage> sortedBookedPackages =
            List.from(result.bookingSessionDeatils?.BookedPackages ?? []);
        sortedBookedPackages.sort((a, b) {
          final orderA = packageOrder[a.EventPackageCode] ?? -1;
          final orderB = packageOrder[b.EventPackageCode] ?? -1;
          return orderA.compareTo(orderB);
        });

        bookedPackages = sortedBookedPackages;
        emit(state.copyWith(bookedPackages: sortedBookedPackages));
      }

      if (result.bookingSessionDeatils?.IsBookingCompleted ==
          StringConst.yesKey) {
        add(CreateSessionDirectly(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
        ));
      } else {
        //For updating participant data after adding 1st participant------------
        if (event.updateValueFor1stUser == true) {
          int pIndex = getPackageIndex(event.ticketIndex!);
          nameControllers[event.ticketIndex!].add(TextEditingController(
              text: bookedPackages[pIndex].Participants?[0].ParticipantName ??
                  ""));
          emailControllers[event.ticketIndex!].add(TextEditingController(
              text: bookedPackages[pIndex].Participants?[0].ParticipantEmail ??
                  ""));

          emit(state.copyWith(
            bookingSessionDetailModel: result,
            bookedPackages: bookedPackages,
            qtyList: event.updateTicketQtyList,
            nameControllers: nameControllers,
            emailControllers: emailControllers,
          ));

          //------------------------------
        } else if (event.participantAdded == true) {
          logger.i("Updating BookedPackages after adding participant");

          List<BookedPackage> updatedBookedPackages =
              List.from(state.bookedPackages ?? []);
          int pIndex = getPackageIndex(event.ticketIndex!);
          List<Participant> participantsList =
              bookedPackages[pIndex].Participants!;

          for (var participant in participantsList) {
            int pIndex = getPackageIndex(event.ticketIndex!);
            bool existedParticipant = updatedBookedPackages[pIndex]
                .Participants!
                .any((item) =>
                    item.ParticipantCode == participant.ParticipantCode);
            if (!existedParticipant) {
              List<Participant> participantList =
                  state.bookedPackages![pIndex].Participants ?? [];
              List<Participant> updatedParticipants =
                  List.from(participantList);
              updatedParticipants.add(participant);
              updatedBookedPackages[pIndex] = updatedBookedPackages[pIndex]
                  .copyWith(Participants: updatedParticipants);
            }
          }

          emit(state.copyWith(
            bookingSessionDetailModel: result,
            bookedPackages: updatedBookedPackages,
            qtyList: event.updateTicketQtyList,
            nameControllers: nameControllers,
            emailControllers: emailControllers,
          ));
        } else {
          emit(state.copyWith(
            bookingSessionDetailModel: result,
            bookedPackages: bookedPackages,
            qtyList: event.updateTicketQtyList,
            nameControllers: nameControllers,
            emailControllers: emailControllers,
          ));
        }

        if (event.addInitialParticipantValue == true) {
          add(const InitializeParticipantsController(
              eventData: GetEventWithPackageLimitModel()));
        }

        add(const GetEventInfoWithLimit());
      }
    });
  }

  // FutureOr<void> _bookingSessionDetails(BookingSessionDetailsEvent event,
  //     Emitter<TicketBookingState> emit) async {
  //   emit(state.copyWith(
  //     initialApiStatus: ApiStatus.loading,
  //   ));
  //   final response = await repository.bookingSessionDetailApi();

  //   response.fold((failure) async {
  //     emit(state.copyWith(
  //       initialApiStatus: ApiStatus.failure,
  //       errorMessage: failure.message,
  //     ));
  //   }, (result) async {
  //     emit(state.copyWith(
  //       initialApiStatus: ApiStatus.success,
  //       bookingSessionDetailModel: result,
  //     ));
  //   });
  // }

  FutureOr<void> _getEventInfoWithLimit(
      GetEventInfoWithLimit event, Emitter<TicketBookingState> emit) async {
    // emit(state.copyWith(
    //     initialApiStatus: ApiStatus.loading, callSessionApi: false));

    final response = await repository.getEventWithPackageLimit();

    response.fold((failure) {
      emit(state.copyWith(
        initialApiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (result) {
      if (state.bookedPackages!.isNotEmpty) {
        final eventPackages = result.eventSettings?.EventPackages ?? [];
        add(CreateQtyList(
          length: eventPackages.length,
          eventPackages: eventPackages,
        ));
        add(InitializeParticipantsController(eventData: result));
        emit(state.copyWith(
          initialApiStatus: ApiStatus.success,
          eventInfoWithLimit: result,
          showParticipantField: true,
          qtyPageNavigateByPreviousBtn: false,
        ));
      } else {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.success,
          eventInfoWithLimit: result,
          nameControllers: [],
          emailControllers: [],
          bookedPackages: [],
          showParticipantField: false,
        ));
      }
    });
  }

  FutureOr<void> _ticketBookingNextBtn(TicketBookingNextBtnClicked event,
      Emitter<TicketBookingState> emit) async {
    emit(state.copyWith(stopUpdatingParticipant: false));
    bool isEmpty = false;
    //---- Name and email field validation------------
    for (var ticketIndex = 0;
        ticketIndex < state.nameControllers.length;
        ticketIndex++) {
      for (var participantIndex = 0;
          participantIndex < state.nameControllers[ticketIndex].length;
          participantIndex++) {
        int index = state.nameControllers[ticketIndex].indexWhere(
          (item) =>
              state.nameControllers[ticketIndex][participantIndex].text ==
              item.text,
        );
        // print("object$index");
        // print("object$participantIndex");
        // print(
        //     "current ${state.nameControllers[ticketIndex][participantIndex].text}");
        // print("founded ${state.nameControllers[ticketIndex][index].text}");
        if (index > -1 &&
            participantIndex != index &&
            state.nameControllers[ticketIndex][index].text.isNotEmpty) {
          customErrorSnackBar(event.context,
              message:
                  "Each ticket must be registered with a unique name that matches the Identity card for verification");
          return;
        }
      }
    }

    for (var ticketIndex = 0;
        ticketIndex < state.nameControllers.length;
        ticketIndex++) {
      for (var participantIndex = 0;
          participantIndex < state.nameControllers[ticketIndex].length;
          participantIndex++) {
        // print(
        //     "$ticketIndex $participantIndex ${state.nameControllers[ticketIndex][participantIndex].text}");
        if (state.nameControllers[ticketIndex][participantIndex].text.isEmpty) {
          customErrorSnackBar(event.context,
              message: "One or more participant name fields are empty.");
          isEmpty = true;
          return;
        } else {
          if (state
              .emailControllers[ticketIndex][participantIndex].text.isEmpty) {
            customErrorSnackBar(event.context,
                message: "One or more participant email fields are empty.");
            isEmpty = true;
            return;
          } else {
            if (!state.emailControllers[ticketIndex][participantIndex].text
                .toString()
                .isValidEmail()) {
              customErrorSnackBar(event.context,
                  message:
                      "Please provide an valid email for participant ${participantIndex + 1} on '${state.eventInfoWithLimit?.eventSettings?.EventPackages?[ticketIndex].PackageName}'");
              isEmpty = true;
              return;
            }
          }
        }
      }
    }

    if (isEmpty == false) {
      for (var ticketIndex = 0;
          ticketIndex < state.nameControllers.length;
          ticketIndex++) {
        for (var participantIndex = 0;
            participantIndex < state.nameControllers[ticketIndex].length;
            participantIndex++) {
          int pIndex = getPackageIndex(ticketIndex);
          // print("###########$pIndex");
          // print("###########${state.bookedPackages!.length - 1}");
          if (pIndex < state.bookedPackages!.length &&
              state.stopUpdatingParticipant == false) {
            // Check if this is the last participant in the last ticket
            bool isLastTicket = pIndex == state.bookedPackages!.length - 1;
            bool isLastParticipant = participantIndex ==
                state.nameControllers[ticketIndex].length - 1;
            // print(
            //     "$ticketIndex $participantIndex ${isLastTicket && isLastParticipant}");

            // print("###########$isLastTicket");
            // print("###########$isLastParticipant");
            //-------------Call api----------------
            add(PackageParticipantUpdateEvent(
              name: state.nameControllers[ticketIndex][participantIndex].text,
              email: state.emailControllers[ticketIndex][participantIndex].text,
              packageCode: state.bookedPackages?[pIndex]
                      .Participants?[participantIndex].ParticipantCode ??
                  "",
              isCompleted: isLastTicket && isLastParticipant,
              showLoading: pIndex == 0 && participantIndex == 0,
              context: event.context,
            ));
          }
        }
      }
    }

    int participantCount = 0;
    for (var ticketIndex = 0;
        ticketIndex < state.nameControllers.length;
        ticketIndex++) {
      if (state.nameControllers[ticketIndex].isNotEmpty) {
        participantCount += 1;
      }
    }

    if (participantCount == 0) {
      customErrorSnackBar(event.context,
          message: "Please add at least one participant to proceed");
    }
    //-----------------------------------
  }

  FutureOr<void> _confirmBooking(
    NavigateConfirmBooking event,
    Emitter<TicketBookingState> emit,
  ) {
    event.context.go(StringConst.bookingConfirmationViewRoute);
  }

  FutureOr<void> _updateTicketQty(
      UpdateTicketQty event, Emitter<TicketBookingState> emit) {
    List<int> updateTicketQtyList = List.from(state.qtyList);
    int limit = state.eventInfoWithLimit?.eventSettings
            ?.EventPackages?[event.ticketIndex].PackageLimit ??
        0;
    int userRestriction = state.eventInfoWithLimit?.eventSettings
            ?.EventPackages?[event.ticketIndex].UserRestriction ??
        1;
    if (event.isIncrement) {
      if (state.qtyList[event.ticketIndex] < limit) {
        // For userRestriction 1 -----------------
        if (userRestriction == 1) {
          if (state.qtyList[event.ticketIndex] < 1) {
            updateTicketQtyList[event.ticketIndex] += 1;
            emit(state.copyWith(
              qtyList: updateTicketQtyList,
            ));
          } else {
            customErrorSnackBar(event.context,
                message: state
                        .eventInfoWithLimit
                        ?.eventSettings
                        ?.EventPackages?[event.ticketIndex]
                        .UserRestrictionDetails ??
                    "");
          }
        }
        // For userRestriction 2, 3 -----------------
        else {
          updateTicketQtyList[event.ticketIndex] += 1;
          emit(state.copyWith(
            qtyList: updateTicketQtyList,
          ));
        }
      } else {
        customErrorSnackBar(event.context,
            message: StringConst.ticketLimitReached);
      }
    } else {
      if (state.qtyList[event.ticketIndex] != 0) {
        updateTicketQtyList[event.ticketIndex] -= 1;
      }
      emit(state.copyWith(
        qtyList: updateTicketQtyList,
      ));
    }
  }

  FutureOr<void> _createQtyList(
      CreateQtyList event, Emitter<TicketBookingState> emit) {
    List<int> qtyList = List.generate(event.length, (i) {
      // return state.bookedPackages?[i].Participants?.length ?? 0;
      return 0;
    }).toList();

    for (var bookedPackage in state.bookedPackages!) {
      int packageIndex = event.eventPackages.indexWhere(
          (event) => event.EventPackageCode == bookedPackage.EventPackageCode);
      qtyList[packageIndex] = bookedPackage.Participants?.length ?? 0;
    }

    emit(state.copyWith(qtyList: qtyList));
  }

  FutureOr<void> _createInitialQtyList(
      CreateInitialQtyList event, Emitter<TicketBookingState> emit) {
    List<int> qtyList = List.generate(event.length, (i) {
      return 0;
    }).toList();

    emit(state.copyWith(qtyList: qtyList));
  }

  FutureOr<void> _addMultipleTicketInitial(
      AddMultipleTicketInitial event, Emitter<TicketBookingState> emit) async {
    List<Map<String, dynamic>> packageToAddList = [];
    if (state.eventInfoWithLimit?.eventSettings?.EventPackages != null &&
        state.eventInfoWithLimit!.eventSettings!.EventPackages!.isNotEmpty) {
      for (var i = 0;
          i < state.eventInfoWithLimit!.eventSettings!.EventPackages!.length;
          i++) {
        if (state.qtyList[i] != 0) {
          packageToAddList.add({
            StringConst.eventPackageCodeKey: state.eventInfoWithLimit!
                .eventSettings!.EventPackages![i].EventPackageCode,
            StringConst.numberOfTicketsKey: state.qtyList[i],
          });
        }
      }
    }
    //
    if (state.qtyPageNavigateByPreviousBtn == true) {
      emit(state.copyWith(nameControllers: [], emailControllers: []));
    }
    if (packageToAddList.isNotEmpty) {
      emit(state.copyWith(
        apiStatus: ApiStatus.loading,
      ));
      final response =
          await repository.bookingSessionMultipleTicketAdd(packageToAddList);
      emit(state.copyWith(apiStatus: ApiStatus.completed));
      response.fold((failure) {
        emit(state.copyWith(
          apiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      }, (result) {
        emit(state.copyWith(
          apiStatus: ApiStatus.initial,
        ));
        add(CheckIsSessionCreatedEvent(
          event.context,
          addInitialParticipantValue: true,
        ));
      });
    } else {
      customErrorSnackBar(event.context, message: StringConst.noTicketAdded);
    }
  }

  FutureOr<void> _initializeParticipantsController(
      InitializeParticipantsController event,
      Emitter<TicketBookingState> emit) {
    // List<List<List<TextEditingController>>> participantListForTickets = [];
    List<List<TextEditingController>> nameControllers = [];
    List<List<TextEditingController>> emailControllers = [];
    // participantListForTickets = List.generate(state.qtyList.length, (i1) {
    //   return List.generate(state.qtyList[i1], (i2) {
    //     return List.generate(2, (i3) {
    //       return TextEditingController();
    //     });
    //   });
    // });

    // Sort bookedPackages according to EventPackages order
    if (state.bookedPackages != null &&
        state.bookedPackages!.isNotEmpty &&
        event.eventData.eventSettings?.EventPackages != null) {
      // Create a map of EventPackageCode to index based on EventPackages order
      final packageOrder = Map.fromEntries(
        event.eventData.eventSettings!.EventPackages!.asMap().entries.map(
              (entry) =>
                  MapEntry(entry.value.EventPackageCode ?? '', entry.key),
            ),
      );

      // Create a new sorted list of bookedPackages
      List<BookedPackage> sortedBookedPackages =
          List.from(state.bookedPackages!);
      sortedBookedPackages.sort((a, b) {
        final orderA = packageOrder[a.EventPackageCode] ?? -1;
        final orderB = packageOrder[b.EventPackageCode] ?? -1;
        return orderA.compareTo(orderB);
      });

      // Update state with sorted packages
      emit(state.copyWith(bookedPackages: sortedBookedPackages));
    }

    nameControllers = List.generate(state.qtyList.length, (ticketIndex) {
      if (state.qtyList[ticketIndex] == 0) {
        return [];
      } else {
        return List.generate(
          state.qtyList[ticketIndex],
          (participantIndex) {
            String name = "";

            if (state.bookedPackages!.isNotEmpty) {
              int pIndex = getPackageIndex(ticketIndex);
              name = state.bookedPackages?[pIndex]
                      .Participants?[participantIndex].ParticipantName ??
                  "";
            }
            bool newAdded = state.nameControllers.isNotEmpty;
            return TextEditingController(
              text: newAdded == true
                  ? state.nameControllers[ticketIndex][participantIndex].text
                          .isNotEmpty
                      ? state
                          .nameControllers[ticketIndex][participantIndex].text
                      : name
                  : name,
            );
          },
        );
      }
    });

    emailControllers = List.generate(state.qtyList.length, (ticketIndex) {
      if (state.qtyList[ticketIndex] == 0) {
        return [];
      } else {
        return List.generate(
          state.qtyList[ticketIndex],
          (participantIndex) {
            // print(state.emailControllers.length);
            String email = "";
            if (state.bookedPackages!.isNotEmpty) {
              int pIndex = getPackageIndex(ticketIndex);
              email = state.bookedPackages?[pIndex]
                      .Participants?[participantIndex].ParticipantEmail ??
                  "";
            }
            bool newAdded = state.nameControllers.isNotEmpty;
            return TextEditingController(
              text: newAdded == true
                  ? state.emailControllers[ticketIndex][participantIndex].text
                          .isNotEmpty
                      ? state
                          .emailControllers[ticketIndex][participantIndex].text
                      : email
                  : email,
            );
          },
        );
      }
    });

    emit(state.copyWith(
      // participantListForTicketsController: participantListForTickets,
      nameControllers: nameControllers,
      emailControllers: emailControllers,
      showParticipantField: true, qtyPageNavigateByPreviousBtn: false,
    ));
  }

  // @override
  // Future<void> close() {
  //   for (var controllers in state.nameControllers) {
  //     for (var controller in controllers) {
  //       controller.dispose();
  //     }
  //   }
  //   for (var controllers in state.emailControllers) {
  //     for (var controller in controllers) {
  //       controller.dispose();
  //     }
  //   }
  //   return super.close();
  // }

  FutureOr<void> _addEmptyParticipant(
      AddEmptyParticipant event, Emitter<TicketBookingState> emit) async {
    List<int> updateTicketQtyList = List.from(state.qtyList);
    int limit = state.eventInfoWithLimit?.eventSettings
            ?.EventPackages?[event.ticketIndex].PackageLimit ??
        0;
    int userRestriction = state.eventInfoWithLimit?.eventSettings
            ?.EventPackages?[event.ticketIndex].UserRestriction ??
        1;

    if (state.qtyList[event.ticketIndex] < limit) {
      // For userRestriction 1 -----------------
      if (userRestriction == 1) {
        if (state.qtyList[event.ticketIndex] < 1) {
          updateTicketQtyList[event.ticketIndex] += 1;
          await callAddParticipantAPI(
            emit,
            event.eventPackageCode,
            updateTicketQtyList,
            event.ticketIndex,
            event.context,
          );

          // emit(state.copyWith(
          //   qtyList: updateTicketQtyList,
          // ));
        } else {
          customErrorSnackBar(event.context,
              message: state
                      .eventInfoWithLimit
                      ?.eventSettings
                      ?.EventPackages?[event.ticketIndex]
                      .UserRestrictionDetails ??
                  "");
        }
      }
      // For userRestriction 2, 3 -----------------
      else {
        updateTicketQtyList[event.ticketIndex] += 1;
        await callAddParticipantAPI(
          emit,
          event.eventPackageCode,
          updateTicketQtyList,
          event.ticketIndex,
          event.context,
        );
      }
    } else {
      customErrorSnackBar(event.context,
          message: StringConst.ticketLimitReached);
    }
  }

  Future<void> callAddParticipantAPI(
    Emitter<TicketBookingState> emit,
    String packageCode,
    List<int> updateTicketQtyList,
    int ticketIndex,
    BuildContext context,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final response =
        await repository.bookingSessionPackageAddDummy(packageCode);
    emit(state.copyWith(apiStatus: ApiStatus.completed));
    response.fold((failure) {
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (isSuccess) {
      List<List<TextEditingController>> nameControllers =
          List.from(state.nameControllers);
      List<List<TextEditingController>> emailControllers =
          List.from(state.emailControllers);
      emit(state.copyWith(
        apiStatus: ApiStatus.initial,
      ));

      if (nameControllers[ticketIndex].isEmpty) {
        //Added 1st user. Need to get the details and initialize
        add(CheckIsSessionCreatedUpdateEvent(
          context,
          updateValueFor1stUser: true,
          ticketIndex: ticketIndex,
          updateTicketQtyList: updateTicketQtyList,
        ));
      } else {
        nameControllers[ticketIndex].add(TextEditingController());
        emailControllers[ticketIndex].add(TextEditingController());
        emit(state.copyWith(
          qtyList: updateTicketQtyList,
          nameControllers: nameControllers,
          emailControllers: emailControllers,
        ));
        add(CheckIsSessionCreatedUpdateEvent(
          context,
          participantAdded: true,
          ticketIndex: ticketIndex,
        ));
      }
    });
  }

  FutureOr<void> _deleteParticipant(
      DeleteParticipant event, Emitter<TicketBookingState> emit) async {
    List<int> updateTicketQtyList = List.from(state.qtyList);
    // print(updateTicketQtyList[event.ticketIndex]);

    int userRestriction = state.eventInfoWithLimit?.eventSettings
            ?.EventPackages?[event.ticketIndex].UserRestriction ??
        1;

    // String userName =
    //     "${state.bookingSessionDetailModel?.bookingSessionDeatils?.BookedMemberFirstName ?? ""} ${state.bookingSessionDetailModel?.bookingSessionDeatils?.BookedMemberLastName ?? ""}";
    // print(
    //     "###################${isFirstUser(userName, state.bookedPackages?[event.ticketIndex].Participants?[event.participantIndex].ParticipantName ?? "")}");
    // For userRestriction 1,3 -----------------
    if (userRestriction == 1 || userRestriction == 3) {
      updateTicketQtyList[event.ticketIndex] -= 1;
      await callDeleteParticipantAPI(
        emit,
        event.participantCode,
        updateTicketQtyList,
        event.ticketIndex,
        event.participantIndex,
        event.context,
      );
    }
    // For userRestriction 2 -----------------
    else {
      if (state.qtyList[event.ticketIndex] > 1) {
        String userName =
            "${state.bookingSessionDetailModel?.bookingSessionDeatils?.BookedMemberFirstName ?? ""} ${state.bookingSessionDetailModel?.bookingSessionDeatils?.BookedMemberLastName ?? ""}";
        int pIndex = getPackageIndex(event.ticketIndex);
        if (!isFirstUser(
            userName,
            state.bookedPackages?[pIndex].Participants?[event.participantIndex]
                    .ParticipantName ??
                "")) {
          updateTicketQtyList[event.ticketIndex] -= 1;
          await callDeleteParticipantAPI(
            emit,
            event.participantCode,
            updateTicketQtyList,
            event.ticketIndex,
            event.participantIndex,
            event.context,
          );
        } else {
          customErrorSnackBar(event.context,
              message: state
                      .eventInfoWithLimit
                      ?.eventSettings
                      ?.EventPackages?[event.ticketIndex]
                      .UserRestrictionDetails ??
                  "");
        }
      } else {
        updateTicketQtyList[event.ticketIndex] -= 1;
        await callDeleteParticipantAPI(
          emit,
          event.participantCode,
          updateTicketQtyList,
          event.ticketIndex,
          event.participantIndex,
          event.context,
        );
      }
    }
  }

  Future<void> callDeleteParticipantAPI(
    Emitter<TicketBookingState> emit,
    String participantCode,
    List<int> updateTicketQtyList,
    int ticketIndex,
    int participantIndex,
    BuildContext context,
  ) async {
    // print(state.bookingSessionDetailModel);
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final response = await repository.deleteParticipant(participantCode);
    emit(state.copyWith(apiStatus: ApiStatus.completed));
    response.fold((failure) {
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (isSuccess) {
      List<List<TextEditingController>> nameControllers =
          List.from(state.nameControllers);
      List<List<TextEditingController>> emailControllers =
          List.from(state.emailControllers);

      List<BookedPackage> updatedBookedPackages =
          List.from(state.bookedPackages ?? []);
      int pIndex = getPackageIndex(ticketIndex);
      BookedPackage bookedPackage = updatedBookedPackages[pIndex];
      List<Participant> participants =
          List.from(bookedPackage.Participants ?? []);
      participants.removeAt(participantIndex);
      if (participants.isEmpty) {
        updatedBookedPackages.removeAt(pIndex);
      } else {
        updatedBookedPackages[pIndex] = bookedPackage.copyWith(
          Participants: participants,
        );
      }

      nameControllers[ticketIndex].removeAt(participantIndex);
      emailControllers[ticketIndex].removeAt(participantIndex);

      emit(state.copyWith(
        apiStatus: ApiStatus.initial,
        qtyList: updateTicketQtyList,
        nameControllers: nameControllers,
        emailControllers: emailControllers,
        bookedPackages: updatedBookedPackages,
      ));
    });
  }

  FutureOr<void> _packageParticipantUpdateEvent(
      PackageParticipantUpdateEvent event,
      Emitter<TicketBookingState> emit) async {
    // bool isCompleted=;
    // bool showLoading=;
    if (event.showLoading) {
      emit(state.copyWith(
        apiStatus: ApiStatus.loading,
      ));
    }
    final response = await repository.bookingSessionPackageUpdate(
      event.packageCode,
      event.name,
      event.email,
    );

    response.fold((failure) {
      emit(state.copyWith(apiStatus: ApiStatus.completed));
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
        stopUpdatingParticipant: true,
      ));
    }, (result) {
      // if(event.isCompleted) emit(state.copyWith(apiStatus: ApiStatus.completed));
      // emit(state.copyWith(
      //   apiStatus: ApiStatus.initial,
      // ));
      if (event.isCompleted) {
        add(
          CheckAllParticipantUpdatedEvent(
            isCompleted: event.isCompleted,
            context: event.context,
          ),
        );
      }
    });
  }

  FutureOr<void> _checkAllParticipantUpdatedEvent(
      CheckAllParticipantUpdatedEvent event,
      Emitter<TicketBookingState> emit) async {
    try {
      final response =
          await repository.bookingSessionCheckAllParticipantsUpdated();
      // emit(state.copyWith(apiStatus: ApiStatus.completed));
      final result1 = await response.fold((failure) async {
        emit(state.copyWith(
          apiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
        return false;
      }, (result) async {
        emit(state.copyWith(
          apiStatus: ApiStatus.initial,
        ));
        return true;
      });
      if (result1) {
        //------------------------------------------
        // Check free booking and confirm free booking. If its not a free booking,
        // Will navigate to promo code page

        final response = await repository.isFreeBooking();
        emit(state.copyWith(apiStatus: ApiStatus.completed));
        response.fold((failure) {
          customErrorSnackBar(
            event.context,
            message: failure.message,
          );
        }, (bookingSession) {
          if (bookingSession.IsFree == StringConst.paymentNeeded) {
            if (state.bookingSessionDetailModel?.bookingSessionDeatils
                    ?.SubTotal ==
                0) {
              customErrorSnackBar(
                event.context,
                message: 'Please Add Some Participants',
              );
            } else {
              emit(state.copyWith(
                apiStatus: ApiStatus.initial,
              ));
              event.context.go(StringConst.promoCodeViewRoute);
            }
          } else {
            emit(state.copyWith(
              showFreeTicketField: true,
              showParticipantField: false,
              qtyPageNavigateByPreviousBtn: false,
            ));
          }
        });
      }
    } catch (e) {
      print("Catch error");
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _confirmFreeBooking(
      ConfirmFreeBooking event, Emitter<TicketBookingState> emit) async {
    popupLoading(event.context);
    final confirmResponse = await repository.confirmFreeBooking();
    if (event.context.mounted) {
      event.context.pop();
    }
    confirmResponse.fold((failure) {
      customErrorSnackBar(
        event.context,
        message: failure.message,
      );
    }, (res) {
      if (event.context.mounted) {
        add(NavigateConfirmBooking(
          event.context,
        ));
      }
    });
  }

  bool isFirstUser(
    String userName,
    String participantName,
  ) {
    return userName == participantName ? true : false;
  }

  FutureOr<void> _checkIsSessionCreatedUpdateEvent(
      CheckIsSessionCreatedUpdateEvent event,
      Emitter<TicketBookingState> emit) async {
    final bookingSession =
        await GetStorage().read(StringConst.isBookingSessionExistedKey);
    if (event.context.mounted) {
      if (bookingSession != null) {
        add(GetUpdatedBookingSessionEvent(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
          participantAdded: event.participantAdded,
        ));
      } else {
        add(CreateSessionDirectly(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
        ));
      }
    }
  }

  FutureOr<void> _getUpdateBookingSessionInformation(
      GetUpdatedBookingSessionEvent event,
      Emitter<TicketBookingState> emit) async {
    print("Get Updated Session");
    popupLoading(event.context);
    final response = await repository.bookingSessionDetailApi();

    response.fold((failure) async {
      event.context.pop();
      if (failure.message == StringConst.userNotMatchedError) {
        add(CreateSessionDirectly(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
        ));
      } else {
        emit(state.copyWith(
          apiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      }
    }, (result) async {
      //For updating participant data after adding 1st participant------------
      List<List<TextEditingController>> nameControllers =
          List.from(state.nameControllers);
      List<List<TextEditingController>> emailControllers =
          List.from(state.emailControllers);
      //------------------------------

      //
      List<BookedPackage> bookedPackages = [];
      if (state.eventInfoWithLimit?.eventSettings?.EventPackages == null) {
        bookedPackages = result.bookingSessionDeatils?.BookedPackages ?? [];
        emit(state.copyWith(bookedPackages: bookedPackages));
      } else {
        // Sort bookedPackages according to EventPackages order

        // Create a map of EventPackageCode to index based on EventPackages order
        final packageOrder = Map.fromEntries(
          state.eventInfoWithLimit!.eventSettings!.EventPackages!
              .asMap()
              .entries
              .map(
                (entry) =>
                    MapEntry(entry.value.EventPackageCode ?? '', entry.key),
              ),
        );

        // Create a new sorted list of bookedPackages
        List<BookedPackage> sortedBookedPackages =
            List.from(result.bookingSessionDeatils?.BookedPackages ?? []);
        sortedBookedPackages.sort((a, b) {
          final orderA = packageOrder[a.EventPackageCode] ?? -1;
          final orderB = packageOrder[b.EventPackageCode] ?? -1;
          return orderA.compareTo(orderB);
        });
        bookedPackages = sortedBookedPackages;
        emit(state.copyWith(bookedPackages: sortedBookedPackages));
      }

      if (result.bookingSessionDeatils?.IsBookingCompleted ==
          StringConst.yesKey) {
        event.context.pop();
        add(CreateSessionDirectly(
          event.context,
          addInitialParticipantValue: event.addInitialParticipantValue,
          updateValueFor1stUser: event.updateValueFor1stUser,
          ticketIndex: event.ticketIndex,
          updateTicketQtyList: event.updateTicketQtyList,
        ));
      } else {
        //For updating participant data after adding 1st participant------------
        if (event.updateValueFor1stUser == true) {
          int pIndex = getPackageIndex(event.ticketIndex!);
          nameControllers[event.ticketIndex!].add(TextEditingController(
              text: bookedPackages[pIndex].Participants?[0].ParticipantName ??
                  ""));
          emailControllers[event.ticketIndex!].add(TextEditingController(
              text: bookedPackages[pIndex].Participants?[0].ParticipantEmail ??
                  ""));

          emit(state.copyWith(
            bookingSessionDetailModel: result,
            bookedPackages: bookedPackages,
            qtyList: event.updateTicketQtyList,
            nameControllers: nameControllers,
            emailControllers: emailControllers,
          ));

          //------------------------------
        } else if (event.participantAdded == true) {
          logger.i("Updating BookedPackages after adding participant");

          List<BookedPackage> updatedBookedPackages =
              List.from(state.bookedPackages ?? []);
          int pIndex = getPackageIndex(event.ticketIndex!);
          List<Participant> participantsList =
              bookedPackages[pIndex].Participants!;

          for (var participant in participantsList) {
            int pIndex = getPackageIndex(event.ticketIndex!);
            bool existedParticipant = updatedBookedPackages[pIndex]
                .Participants!
                .any((item) =>
                    item.ParticipantCode == participant.ParticipantCode);
            if (!existedParticipant) {
              List<Participant> participantList =
                  state.bookedPackages![pIndex].Participants ?? [];
              List<Participant> updatedParticipants =
                  List.from(participantList);
              updatedParticipants.add(participant);
              updatedBookedPackages[pIndex] = updatedBookedPackages[pIndex]
                  .copyWith(Participants: updatedParticipants);
            }
          }

          emit(state.copyWith(
            bookingSessionDetailModel: result,
            bookedPackages: updatedBookedPackages,
            qtyList: event.updateTicketQtyList,
            nameControllers: nameControllers,
            emailControllers: emailControllers,
          ));
        } else {
          emit(state.copyWith(
            bookingSessionDetailModel: result,
            bookedPackages: bookedPackages,
            qtyList: event.updateTicketQtyList,
            nameControllers: nameControllers,
            emailControllers: emailControllers,
          ));
        }

        if (event.addInitialParticipantValue == true) {
          add(const InitializeParticipantsController(
              eventData: GetEventWithPackageLimitModel()));
        }

        add(const GetUpdatedEventInfoWithLimit());
      }
    });
  }

  FutureOr<void> _getUpdatedEventInfoWithLimit(
      GetUpdatedEventInfoWithLimit event,
      Emitter<TicketBookingState> emit) async {
    print("Get Updated Event details");
    final response = await repository.getEventWithPackageLimit();
    emit(state.copyWith(
      apiStatus: ApiStatus.completed,
    ));
    response.fold((failure) {
      emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      ));
    }, (result) {
      if (state.bookedPackages!.isNotEmpty) {
        final eventPackages = result.eventSettings?.EventPackages ?? [];
        add(CreateQtyList(
          length: eventPackages.length,
          eventPackages: eventPackages,
        ));
        add(InitializeParticipantsController(eventData: result));
        emit(state.copyWith(
          apiStatus: ApiStatus.initial,
          eventInfoWithLimit: result,
          showParticipantField: true,
          qtyPageNavigateByPreviousBtn: false,
        ));
      } else {
        emit(state.copyWith(
          apiStatus: ApiStatus.initial,
          eventInfoWithLimit: result,
          showParticipantField: false,
        ));
      }
    });
  }

  FutureOr<void> _backToParticipantAddPage(
      BackToParticipantAddPage event, Emitter<TicketBookingState> emit) {
    emit(state.copyWith(
      showFreeTicketField: false,
      showParticipantField: true,
      qtyPageNavigateByPreviousBtn: false,
    ));
  }

  FutureOr<void> _backToQuantityAddPage(
      BackToQuantityAddPage event, Emitter<TicketBookingState> emit) {
    add(CreateQtyList(
      length:
          state.eventInfoWithLimit?.eventSettings?.EventPackages?.length ?? 0,
      eventPackages:
          state.eventInfoWithLimit?.eventSettings?.EventPackages ?? [],
    ));
    emit(state.copyWith(
      showParticipantField: false,
      qtyPageNavigateByPreviousBtn: true,
    ));
  }
}
