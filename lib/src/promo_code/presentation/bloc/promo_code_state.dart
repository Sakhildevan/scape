part of 'promo_code_bloc.dart';

enum Status { initial, success, failure }

class PromoCodeState extends Equatable {
  final BookingSessionDetailModel? bookingSessionDetailModel;
  final bool isPromoCodeApplied;
  final bool isFreeBooking;
  final Status status;
  final ApiStatus apiStatus;
  final ApiStatus initialApiStatus;
  final String errorMessage;

  const PromoCodeState({
    this.bookingSessionDetailModel,
    this.isPromoCodeApplied = false,
    this.isFreeBooking = false,
    this.status = Status.initial,
    this.apiStatus = ApiStatus.initial,
    this.initialApiStatus = ApiStatus.initial,
    this.errorMessage = "",
  });

  @override
  List<Object?> get props => [
        bookingSessionDetailModel,
        isPromoCodeApplied,
        isFreeBooking,
        status,
        apiStatus,
        initialApiStatus,
        errorMessage,
      ];

  PromoCodeState copyWith({
    BookingSessionDetailModel? bookingSessionDetailModel,
    ApiStatus? apiStatus,
    ApiStatus? initialApiStatus,
    String? errorMessage,
    bool? isPromoCodeApplied,
    bool? isFreeBooking,
  }) {
    return PromoCodeState(
      bookingSessionDetailModel:
          bookingSessionDetailModel ?? this.bookingSessionDetailModel,
      apiStatus: apiStatus ?? this.apiStatus,
      initialApiStatus: initialApiStatus ?? this.initialApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isPromoCodeApplied: isPromoCodeApplied ?? this.isPromoCodeApplied,
      isFreeBooking: isFreeBooking ?? this.isFreeBooking,
    );
  }
}

// final class PromoCodeInitial extends PromoCodeState {}
