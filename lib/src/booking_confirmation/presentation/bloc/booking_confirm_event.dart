part of 'booking_confirm_bloc.dart';

sealed class BookingConfirmEvent extends Equatable {
  const BookingConfirmEvent();

  @override
  List<Object> get props => [];
}

class GetDetailAPI extends BookingConfirmEvent {
  const GetDetailAPI();

  @override
  List<Object> get props => [];
}

class GetTicketFromBookingSessionAPI extends BookingConfirmEvent {
  const GetTicketFromBookingSessionAPI();

  @override
  List<Object> get props => [];
}

class ToggleTextExpandEventP extends BookingConfirmEvent {
  final bool currentValue;
  const ToggleTextExpandEventP(this.currentValue);
  @override
  List<Object> get props => [currentValue];
}
