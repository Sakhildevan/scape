part of 'promo_code_bloc.dart';

sealed class PromoCodeEvent extends Equatable {
  const PromoCodeEvent();

  @override
  List<Object> get props => [];
}

class GetBookingSessionDetails extends PromoCodeEvent {}

class PromoCodeNext extends PromoCodeEvent {
  final String promoCode;
  final BuildContext context;

  const PromoCodeNext(this.promoCode, this.context);

  @override
  List<Object> get props => [
        promoCode,
        context,
      ];
}

class PromoCodePrevious extends PromoCodeEvent {
  const PromoCodePrevious(this.context);
  final BuildContext context;
  @override
  List<Object> get props => [
        context,
      ];
}

class PromoCodeNextBtnClicked extends PromoCodeEvent {
  final BuildContext context;
  final String promoCode;

  const PromoCodeNextBtnClicked(this.context, this.promoCode);

  @override
  List<Object> get props => [
        context,
        promoCode,
      ];
}

class NavigateConfirmBooking extends PromoCodeEvent {
  final BuildContext context;

  const NavigateConfirmBooking(this.context);

  @override
  List<Object> get props => [
        context,
      ];
}

class ValidatePayment extends PromoCodeEvent {
  final String paymentReturnToken;
  final BuildContext context;

  const ValidatePayment(
    this.paymentReturnToken,
    this.context,
  );

  @override
  List<Object> get props => [
        paymentReturnToken,
        context,
      ];
}
