part of 'participant_ticket_bloc.dart';

class ParticipantTicketState extends Equatable {
  final ApiStatus apiStatus;
  final String errorMsg;
  final bool isExpandedText;
  final ParticipantTicketModel participantTicketModel;
  final List<ParticipantTicketModel> ticketList;
  const ParticipantTicketState({
    this.apiStatus = ApiStatus.initial,
    this.errorMsg = '',
    this.isExpandedText = false,
    this.ticketList = const <ParticipantTicketModel>[],
    this.participantTicketModel = const ParticipantTicketModel(),
  });
  ParticipantTicketState copyWith({
    ApiStatus? apiStatus,
    List<ParticipantTicketModel>? ticketList,
    String? errorMsg,
    ParticipantTicketModel? participantTicketModel,
    bool? isExpandedText,
  }) {
    return ParticipantTicketState(
      isExpandedText: isExpandedText ?? this.isExpandedText,
      apiStatus: apiStatus ?? this.apiStatus,
      ticketList: ticketList ?? this.ticketList,
      errorMsg: errorMsg ?? this.errorMsg,
      participantTicketModel:
          participantTicketModel ?? this.participantTicketModel,
    );
  }

  @override
  List<Object> get props => [
        apiStatus,
        isExpandedText,
        ticketList,
        errorMsg,
        participantTicketModel,
      ];
}
