part of 'booking_confirm_bloc.dart';

class BookingConfirmState extends Equatable {
  final BookingSessionDetailModel? bookingSessionDetailModel;
  final List<BookedPackage>? bookedParticipants;
  final ApiStatus apiStatus;
  final ApiStatus initialApiStatus;
  final String errorMessage;
  final String ticketCode;

  const BookingConfirmState({
    this.bookingSessionDetailModel,
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
    this.errorMessage = "",
    this.ticketCode = "",
    this.bookedParticipants,
  });

  @override
  List<Object?> get props => [
        bookingSessionDetailModel,
        apiStatus,
        initialApiStatus,
        errorMessage,
        ticketCode,
        bookedParticipants,
      ];

  BookingConfirmState copyWith({
    BookingSessionDetailModel? bookingSessionDetailModel,
    ApiStatus? apiStatus,
    ApiStatus? initialApiStatus,
    String? errorMessage,
    String? ticketCode,
    List<BookedPackage>? bookedParticipants,
  }) {
    return BookingConfirmState(
      bookingSessionDetailModel:
          bookingSessionDetailModel ?? this.bookingSessionDetailModel,
      apiStatus: apiStatus ?? this.apiStatus,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      ticketCode: ticketCode ?? this.ticketCode,
      bookedParticipants: bookedParticipants ?? this.bookedParticipants,
    );
  }
}

class ToggleTextExpandStateP extends BookingConfirmState {
  final bool isExpandedText;
  const ToggleTextExpandStateP({this.isExpandedText = false});
  @override
  List<Object> get props => [isExpandedText];
}
