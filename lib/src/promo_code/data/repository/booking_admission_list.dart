import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';

// import 'package:scape/core/utils/cookie.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/promo_code/data/model/payment_return_model/payment_return_model.dart';
import 'package:scape/src/ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';

import '../../../../core/utils/common-model/common_model.dart';
import '../data_source/promo_code_data_source.dart';
import '../model/free_booking_model/is_free_booking_model.dart';
import '../model/get_payment_url_model/get_payment_url_model.dart';
// import 'dart:html';

final DateTime today = DateTime.now();

class PromoCodeRepository {
  final PromoCodeDataSource promoCodeDataSource;

  PromoCodeRepository({required this.promoCodeDataSource});

  ResultFuture<BookingSessionDetailModel> getDetailAPI() async {
    try {
      final response = await promoCodeDataSource.bookingSessionDetailApi(
          bookingSession:
              await GetStorage().read(StringConst.isBookingSessionExistedKey));
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> applyPromoCode({
    required String promoCode,
  }) async {
    try {
      final response = await promoCodeDataSource.applyPromoCode(
        bookingSession:
            await GetStorage().read(StringConst.isBookingSessionExistedKey),
        promoCode: promoCode,
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> removePromotion() async {
    try {
      final response = await promoCodeDataSource.removePromotion(
        bookingSession: await GetStorage().read(
          StringConst.isBookingSessionExistedKey,
        ),
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<IsBookingFreeModel> isFreeBooking() async {
    try {
      final response = await promoCodeDataSource.isFreeBooking(
        bookingSession: await GetStorage().read(
          StringConst.isBookingSessionExistedKey,
        ),
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> confirmFreeBooking() async {
    try {
      final response = await promoCodeDataSource.confirmFreeBooking(
        bookingSession: await GetStorage().read(
          StringConst.isBookingSessionExistedKey,
        ),
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<GetPaymentUrlModel> getPaymentUrl() async {
    try {
      final response = await promoCodeDataSource.getPaymentUrl(
        bookingSession: await GetStorage().read(
          StringConst.isBookingSessionExistedKey,
        ),
      );

      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<PaymentReturnModel> validatePaymentReturn({
    required String paymentReturnToken,
  }) async {
    try {
      final response = await promoCodeDataSource.validatePaymentReturn(
          paymentReturnToken: paymentReturnToken);
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
