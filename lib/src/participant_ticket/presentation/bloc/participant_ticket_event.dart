part of 'participant_ticket_bloc.dart';

class ParticipantTicketEvent extends Equatable {
  const ParticipantTicketEvent();

  @override
  List<Object> get props => [];
}

class ParticipantTicketDetails extends ParticipantTicketEvent {
  final String ticketCode;
  const ParticipantTicketDetails({required this.ticketCode});

  @override
  List<Object> get props => [ticketCode];
}

class ToggleTextExpandEventParticipant extends ParticipantTicketEvent {
  final bool currentValue;
  const ToggleTextExpandEventParticipant(this.currentValue);
  @override
  List<Object> get props => [currentValue];
}
