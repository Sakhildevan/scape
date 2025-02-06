part of 'ticket_details_bloc.dart';

enum TIMER { initial, running, complete }

class TicketDetailsState extends Equatable {
  final ProfileModelTest? profileModel;
  final StaticPageModel? staticPageModel;
  final DynamicTicketModel? dynamicTicketModel;
  final List<AdmissionModel>? admissionsList;
  final List<ParticipantModel>? participantsList;
  final Map<String, List<ParticipantTicket>> sortedMap;
  final List<TicketModel> ticket;
  final TicketModel ticketModel;
  final String errorMessage;
  final int timerDuration;
  final bool isExpandedText;
  final ApiStatus apiStatus;
  final TIMER timerStatus;
  final ApiStatus initialApiStatus;

  const TicketDetailsState({
    this.profileModel,
    this.staticPageModel,
    this.dynamicTicketModel,
    this.admissionsList,
    this.participantsList,
    this.ticket = const <TicketModel>[],
    this.ticketModel = const TicketModel(),
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
    this.timerStatus = TIMER.initial,
    this.errorMessage = '',
    this.timerDuration = 0,
    this.isExpandedText = false,
    this.sortedMap = const {},
  });

  @override
  List<Object?> get props => [
        profileModel,
        dynamicTicketModel,
        admissionsList,
        ticket,
        apiStatus,
        initialApiStatus,
        timerStatus,
        timerDuration,
        errorMessage,
        isExpandedText,
        staticPageModel,
        ticketModel,
      ];

  TicketDetailsState copyWith({
    ProfileModelTest? profileModel,
    DynamicTicketModel? dynamicTicketModel,
    List<AdmissionModel>? admissionsList,
    List<ParticipantModel>? participantsList,
    StaticPageModel? staticPageModel,
    List<TicketModel>? ticket,
    TicketModel? ticketModel,
    ApiStatus? apiStatus,
    ApiStatus? initialApiStatus,
    TIMER? timerStatus,
    String? errorMessage,
    int? timerDuration,
    bool? isExpandedText,
    Map<String, List<ParticipantTicket>>? sortedMap,
  }) {
    return TicketDetailsState(
      dynamicTicketModel: dynamicTicketModel ?? this.dynamicTicketModel,
      profileModel: profileModel ?? this.profileModel,
      staticPageModel: staticPageModel ?? this.staticPageModel,
      admissionsList: admissionsList ?? this.admissionsList,
      participantsList: participantsList ?? this.participantsList,
      ticket: ticket ?? this.ticket,
      apiStatus: apiStatus ?? this.apiStatus,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      timerStatus: timerStatus ?? this.timerStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      timerDuration: timerDuration ?? this.timerDuration,
      isExpandedText: isExpandedText ?? this.isExpandedText,
      sortedMap: sortedMap ?? this.sortedMap,
      ticketModel: ticketModel ?? this.ticketModel,
    );
  }
}
