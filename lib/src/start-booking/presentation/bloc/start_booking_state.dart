part of 'start_booking_bloc.dart';

class StartBookingState extends Equatable {
  final ApiStatus initialApiStatus;
  final String errorMessage;
  const StartBookingState({
    this.initialApiStatus = ApiStatus.initial,
    this.errorMessage = "",
  });
  @override
  List<Object> get props => [
        initialApiStatus,
        errorMessage,
      ];

  StartBookingState copyWith({
    ApiStatus? initialApiStatus,
    String? errorMessage,
  }) {
    return StartBookingState(
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
