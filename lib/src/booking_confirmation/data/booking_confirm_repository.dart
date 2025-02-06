import 'package:dartz/dartz.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/booking_confirmation/data/model/ticket_from_booking_session.dart';
import 'package:scape/src/ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';

import 'booking_confirm_datasource.dart';

// import 'dart:html';

class BookingConfirmationRepository {
  final BookingConfirmDatasource bookingConfirmDatasource;

  BookingConfirmationRepository({required this.bookingConfirmDatasource});

  ResultFuture<BookingSessionDetailModel> checkIsEventSessionSaved() async {
    try {
      final bookingSessionDetailResponse =
          await bookingConfirmDatasource.bookingSessionDetailApi();
      return Right(bookingSessionDetailResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<TicketFromBookingSession>
      getTicketCodeByBookingSessionApi() async {
    try {
      final bookingSessionDetailResponse =
          await bookingConfirmDatasource.getTicketCodeByBookingSessionApi();
      return Right(bookingSessionDetailResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
