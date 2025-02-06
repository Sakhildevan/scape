part of 'start_booking_bloc.dart';

sealed class StartBookingEvent extends Equatable {
  const StartBookingEvent();

  @override
  List<Object> get props => [];
}

class StoreEventInformation extends StartBookingEvent {
  final String? eventKey;

  const StoreEventInformation({
    this.eventKey,
  });

  @override
  List<Object> get props => [];
}
