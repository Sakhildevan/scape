part of 'ticket_booking_bloc.dart';

class TicketBookingState extends Equatable {
  final BookingSessionDetailModel? bookingSessionDetailModel;
  final GetEventWithPackageLimitModel? eventInfoWithLimit;
  final List<BookedPackage>? bookedPackages;
  final List<int> qtyList;
  final List<TicketsParticipantListModel> participantListForTickets;
  final ApiStatus apiStatus;
  final ApiStatus initialApiStatus;
  final String errorMessage;
  final String participantName;
  final String participantEmail;
  final String packageCode;
  final bool allowedAddPackage;
  final bool isEmptyParticipant;
  final bool stopUpdatingParticipant;
  final bool showParticipantField;
  final bool showFreeTicketField;
  final bool qtyPageNavigateByPreviousBtn;
  final List<List<TextEditingController>> nameControllers;
  final List<List<TextEditingController>> emailControllers;
  // final List<List<List<TextEditingController>>>
  //     participantListForTicketsController;

  const TicketBookingState({
    this.nameControllers = const [],
    this.emailControllers = const [],
    // this.participantListForTicketsController = const [],
    this.bookingSessionDetailModel,
    this.eventInfoWithLimit,
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
    this.errorMessage = "",
    this.bookedPackages,
    this.qtyList = const [],
    this.participantListForTickets = const [],
    this.allowedAddPackage = false,
    this.qtyPageNavigateByPreviousBtn = false,
    this.showFreeTicketField = false,
    this.isEmptyParticipant = false,
    this.stopUpdatingParticipant = false,
    this.showParticipantField = false,
    this.participantName = '',
    this.participantEmail = '',
    this.packageCode = '',
  });

  @override
  List<Object?> get props => [
        showFreeTicketField,
        nameControllers,
        emailControllers,
        // participantListForTicketsController,
        bookingSessionDetailModel,
        eventInfoWithLimit,
        apiStatus,
        initialApiStatus,
        errorMessage,
        bookedPackages,
        qtyList,
        allowedAddPackage,
        qtyPageNavigateByPreviousBtn,
        participantName,
        participantEmail,
        packageCode,
        isEmptyParticipant,
        stopUpdatingParticipant,
        showParticipantField,
        participantListForTickets,
      ];

  TicketBookingState copyWith(
      {List<List<TextEditingController>>? nameControllers,
      List<List<TextEditingController>>? emailControllers,
      // List<List<List<TextEditingController>>>?
      //     participantListForTicketsController,
      BookingSessionDetailModel? bookingSessionDetailModel,
      GetEventWithPackageLimitModel? eventInfoWithLimit,
      ApiStatus? apiStatus,
      ApiStatus? initialApiStatus,
      String? errorMessage,
      List<BookedPackage>? bookedPackages,
      List<int>? qtyList,
      bool? allowedAddPackage,
      bool? isEmptyParticipant,
      bool? stopUpdatingParticipant,
      bool? showParticipantField,
      bool? showFreeTicketField,
      bool? qtyPageNavigateByPreviousBtn,
      String? participantName,
      String? participantEmail,
      List<TicketsParticipantListModel>? participantListForTickets,
      String? packageCode}) {
    return TicketBookingState(
      nameControllers: nameControllers ?? this.nameControllers,
      emailControllers: emailControllers ?? this.emailControllers,
      // participantListForTicketsController:
      //     participantListForTicketsController ??
      //         this.participantListForTicketsController,
      bookingSessionDetailModel:
          bookingSessionDetailModel ?? this.bookingSessionDetailModel,
      eventInfoWithLimit: eventInfoWithLimit ?? this.eventInfoWithLimit,
      apiStatus: apiStatus ?? this.apiStatus,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      bookedPackages: bookedPackages ?? this.bookedPackages,
      qtyList: qtyList ?? this.qtyList,
      allowedAddPackage: allowedAddPackage ?? this.allowedAddPackage,
      participantEmail: participantEmail ?? this.participantEmail,
      participantName: participantName ?? this.participantName,
      packageCode: packageCode ?? this.packageCode,
      isEmptyParticipant: isEmptyParticipant ?? this.isEmptyParticipant,
      stopUpdatingParticipant:
          stopUpdatingParticipant ?? this.stopUpdatingParticipant,
      showParticipantField: showParticipantField ?? this.showParticipantField,
      participantListForTickets:
          participantListForTickets ?? this.participantListForTickets,
      showFreeTicketField: showFreeTicketField ?? this.showFreeTicketField,
      qtyPageNavigateByPreviousBtn:
          qtyPageNavigateByPreviousBtn ?? this.qtyPageNavigateByPreviousBtn,
    );
  }
}

class TicketInfoLoading extends TicketBookingState {
  const TicketInfoLoading();

  @override
  List<Object> get props => [];
}

class TicketInfoLoaded extends TicketBookingState {
  const TicketInfoLoaded();

  @override
  List<Object> get props => [];
}

class TicketInfoError extends TicketBookingState {
  final String message;

  const TicketInfoError(this.message);

  @override
  List<Object> get props => [message];
}

class ParticipantRemoved extends TicketBookingState {
  const ParticipantRemoved();

  @override
  List<Object> get props => [];
}
