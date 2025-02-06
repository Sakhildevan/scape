part of 'ticket_details_bloc.dart';

class TicketDetailsEvent extends Equatable {
  const TicketDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchTicket extends TicketDetailsEvent {
  final String ticketCode;
  const FetchTicket({required this.ticketCode});

  @override
  List<Object> get props => [ticketCode];
}

class GetDynamicTicketEvent extends TicketDetailsEvent {
  final String referenceCode;
  const GetDynamicTicketEvent({required this.referenceCode});

  @override
  List<Object> get props => [referenceCode];
}

class GetStaticPage extends TicketDetailsEvent {
  const GetStaticPage();

  @override
  List<Object> get props => [];
}

class ToggleTextExpandEvent extends TicketDetailsEvent {
  final bool currentValue;
  const ToggleTextExpandEvent(this.currentValue);
  @override
  List<Object> get props => [currentValue];
}

class StartTimer extends TicketDetailsEvent {}

class TimerTicked extends TicketDetailsEvent {
  final int duration;
  const TimerTicked(this.duration);
}
