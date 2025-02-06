import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/promo_code/presentation/widgets/invalid_promo_code_alert_box.dart';

import '../../../../core/utils/common_widgets/custom_snackbar.dart';
import '../../../../core/utils/enums.dart';
import '../../../ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';
import '../../data/repository/booking_admission_list.dart';
import 'package:url_launcher/url_launcher.dart';

part 'promo_code_event.dart';

part 'promo_code_state.dart';

class PromoCodeBloc extends Bloc<PromoCodeEvent, PromoCodeState> {
  final PromoCodeRepository promoCodeRepository;
  bool isPromoCodeApplied = false; // Flag for promo code applied state

  PromoCodeBloc({required this.promoCodeRepository})
      : super(const PromoCodeState()) {
    on<GetBookingSessionDetails>(_getBookingSessionDetail);
    on<PromoCodeNextBtnClicked>(_nextBtnClicked);
    on<PromoCodeNext>(_applyPromo);
    on<PromoCodePrevious>(_removePromo);
    on<ValidatePayment>(_validatePayment);
    on<NavigateConfirmBooking>(_confirmBooking);
  }

  FutureOr<void> _applyPromo(
      PromoCodeNext event, Emitter<PromoCodeState> emit) async {
    popupLoading(event.context);
    final response =
        await promoCodeRepository.applyPromoCode(promoCode: event.promoCode);

    response.fold((failure) {
      emit(state.copyWith(
        isPromoCodeApplied: false,
      ));
      event.context.pop();
      showDialog(
        barrierDismissible: true,
        context: event.context,
        builder: (BuildContext context) {
          return InvalidPromoCodeAlertBox(
            promoCode: event.promoCode,
          );
        },
      );
    }, (bookingSession) {
      event.context.pop();
      add(GetBookingSessionDetails());
      emit(state.copyWith(
        isPromoCodeApplied: true,
      ));
    });
  }

  FutureOr<void> _removePromo(
      PromoCodePrevious event, Emitter<PromoCodeState> emit) async {
    popupLoading(event.context);
    final response = await promoCodeRepository.removePromotion();

    response.fold((failure) {
      event.context.pop();
    }, (bookingSession) {
      event.context.pop();
      add(GetBookingSessionDetails());
      emit(state.copyWith(
        isPromoCodeApplied: false,
      ));
    });
  }

  FutureOr<void> _nextBtnClicked(
      PromoCodeNextBtnClicked event, Emitter<PromoCodeState> emit) async {
    if ((state.isPromoCodeApplied == false && event.promoCode.isEmpty) ||
        (state.isPromoCodeApplied == true && event.promoCode.isNotEmpty)) {
      if (state.bookingSessionDetailModel?.bookingSessionDeatils
              ?.IsBookingCompleted ==
          StringConst.yesKey) {
        add(NavigateConfirmBooking(
          event.context,
        ));
        // Need to set the navigation
      } else {
        // final response = await promoCodeRepository.isFreeBooking();
        // response.fold((failure) {
        //   customErrorSnackBar(
        //     event.context,
        //     message: failure.message,
        //   );
        // }, (bookingSession) async {
        //   if (bookingSession.IsFree == StringConst.paymentNeeded) {
        await getPaymentUrl(event, emit);
        //   // } else {
        //   //   await confirmFreeBooking(event, emit);
        //   //   add(NavigateConfirmBooking(
        //   //     event.context,
        //   //   ));
        //   // }
        // });
      }
    } else {
      add(PromoCodeNext(event.promoCode, event.context));
    }
  }

  FutureOr<void> _getBookingSessionDetail(
    GetBookingSessionDetails event,
    Emitter<PromoCodeState> emit,
  ) async {
    emit(state.copyWith(
      initialApiStatus: ApiStatus.loading,
    ));
    final response = await promoCodeRepository.getDetailAPI();
    response.fold(
        (failure) => emit(state.copyWith(
              initialApiStatus: ApiStatus.failure,
              errorMessage: failure.message,
            )), (bookingSession) {
      emit(
        state.copyWith(
          initialApiStatus: ApiStatus.success,
          bookingSessionDetailModel: bookingSession,
        ),
      );
    });
  }

  FutureOr<void> getPaymentUrl(
      PromoCodeNextBtnClicked event, Emitter<PromoCodeState> emit) async {
    popupLoading(event.context);
    final response = await promoCodeRepository.getPaymentUrl();
    response.fold((failure) {
      event.context.pop();
      customErrorSnackBar(
        event.context,
        message: failure.message,
      );
    }, (response) async {
      event.context.pop();
      if (await launchUrl(
        Uri.parse(response.PaymentRedirectURL!),
        webOnlyWindowName: '_self',
      )) {
        throw Exception('Could not launch ${response.PaymentRedirectURL}');
      }
      // validatePaymentReturn(emit, response.PaymentRedirectURL);
    });
  }

  FutureOr<void> _validatePayment(
    ValidatePayment event,
    Emitter<PromoCodeState> emit,
  ) async {
    popupLoading(event.context);
    final response = await promoCodeRepository.validatePaymentReturn(
      paymentReturnToken: event.paymentReturnToken,
    );

    response.fold((failure) {
      event.context.pop();
      customErrorSnackBar(
        event.context,
        message: failure.message,
      );
    }, (response) {
      event.context.pop();
      if (response.paymentReturnDetails?.IsBookingCompleted ==
          StringConst.yesKey) {
        add(NavigateConfirmBooking(
          event.context,
        ));
      }
    });
  }

  FutureOr<void> _confirmBooking(
    NavigateConfirmBooking event,
    Emitter<PromoCodeState> emit,
  ) {
    event.context.go(StringConst.bookingConfirmationViewRoute);
  }
}
