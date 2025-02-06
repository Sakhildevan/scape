import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/helper/logger.dart';

// import 'package:scape/core/utils/cookie.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/ticket_booking/data/data_source/ticket_booking_data_source.dart';
import 'package:scape/src/ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';
import 'package:scape/src/ticket_booking/data/model/create_new_session/create_new_session_model.dart';
import 'package:scape/src/ticket_booking/data/model/get_event_with_package_limit/get_event_with_package_limit_model.dart';

import '../../../../core/utils/common-model/common_model.dart';
import '../../../promo_code/data/model/free_booking_model/is_free_booking_model.dart';
// import 'dart:html';

class TicketBookingRepository {
  final TicketBookingDataSource ticketBookingDataSource;

  TicketBookingRepository({required this.ticketBookingDataSource});

  ResultFuture<BookingSessionDetailModel> checkIsEventSessionSaved() async {
    if (GetStorage().read(StringConst.isBookingSessionExistedKey) != null) {
      try {
        final bookingSessionDetailResponse =
            await ticketBookingDataSource.bookingSessionDetailApi(
                bookingSession: await GetStorage()
                    .read(StringConst.isBookingSessionExistedKey));
        return Right(bookingSessionDetailResponse);
      } on APIException catch (e) {
        logger.e("error");
        return Left(
          APIFailure.fromException(e),
        );
      }
    } else {
      try {
        final createSessionResponse =
            await ticketBookingDataSource.createBookingSession();
        await GetStorage().write(StringConst.isBookingSessionExistedKey,
            createSessionResponse.bookingSessionDetails?.BookingSession ?? '');
        final bookingSessionDetailResponse =
            await ticketBookingDataSource.bookingSessionDetailApi(
                bookingSession: createSessionResponse
                        .bookingSessionDetails?.BookingSession ??
                    '');

        return Right(bookingSessionDetailResponse);
      } on APIException catch (e) {
        return Left(
          APIFailure.fromException(e),
        );
      }
    }
  }

  ResultFuture<CreateNewSessionModel> createBookingSessionDirectly() async {
    try {
      final createSessionResponse =
          await ticketBookingDataSource.createBookingSession();

      return Right(createSessionResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<BookingSessionDetailModel> bookingSessionDetailApi() async {
    try {
      final bookingSession =
          await GetStorage().read(StringConst.isBookingSessionExistedKey);
      final bookingSessionDetailResponse = await ticketBookingDataSource
          .bookingSessionDetailApi(bookingSession: bookingSession);
      return Right(bookingSessionDetailResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<GetEventWithPackageLimitModel> getEventWithPackageLimit() async {
    try {
      final result = await ticketBookingDataSource.getEventWithPackageLimit();

      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> bookingSessionMultipleTicketAdd(
    List<Map<String, dynamic>> packageToAdd,
  ) async {
    try {
      final result =
          await ticketBookingDataSource.bookingSessionMultipleTicketAdd(
        packageToAdd,
      );

      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> bookingSessionPackageAddDummy(
    String eventPackageCode,
  ) async {
    try {
      final result =
          await ticketBookingDataSource.bookingSessionPackageAddDummy(
        eventPackageCode,
      );

      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> deleteParticipant(
    String participantCode,
  ) async {
    try {
      final result = await ticketBookingDataSource.deleteParticipant(
        participantCode,
      );

      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> bookingSessionPackageUpdate(
    String participantCode,
    String participantName,
    String participantEmail,
  ) async {
    try {
      final result = await ticketBookingDataSource.bookingSessionPackageUpdate(
        participantCode,
        participantName,
        participantEmail,
      );

      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> bookingSessionCheckAllParticipantsUpdated() async {
    try {
      final result = await ticketBookingDataSource
          .bookingSessionCheckAllParticipantsUpdated();

      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> addPackageIsAllowed(
      {required String package}) async {
    if (kDebugMode) {
      print('checkCode $package');
    }
    try {
      final bookingSession =
          await GetStorage().read(StringConst.isBookingSessionExistedKey);
      print(bookingSession);
      final commonModel = await ticketBookingDataSource.addPackageIsAllowed(
        bookingSession: bookingSession,
        packageCode: package,
      );
      return Right(commonModel);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> changeNameIsAllowed(
      {required String package}) async {
    if (kDebugMode) {
      print('checkCode $package');
    }
    try {
      final bookingSession =
          await GetStorage().read(StringConst.isBookingSessionExistedKey);
      final commonModel = await ticketBookingDataSource.changeNameIsAllowed(
        bookingSession: bookingSession,
        packageCode: package,
      );
      return Right(commonModel);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> addPackage({
    required String name,
    required String email,
    required String packageCode,
  }) async {
    try {
      final bookingSession =
          await GetStorage().read(StringConst.isBookingSessionExistedKey);
      final bookingSessionDetailResponse =
          await ticketBookingDataSource.addPackage(
        bookingSession: bookingSession,
        packageCode: packageCode,
        name: name,
        email: email,
      );
      return Right(bookingSessionDetailResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> deletePackage({
    required String participantCode,
  }) async {
    try {
      final bookingSession =
          await GetStorage().read(StringConst.isBookingSessionExistedKey);
      final bookingSessionDetailResponse =
          await ticketBookingDataSource.deletePackage(
        bookingSession: bookingSession,
        participantCode: participantCode,
      );
      return Right(bookingSessionDetailResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<IsBookingFreeModel> isFreeBooking() async {
    try {
      final bookingSessionDetailResponse =
          await ticketBookingDataSource.isFreeBooking(
        bookingSession: await GetStorage().read(
          StringConst.isBookingSessionExistedKey,
        ),
      );
      return Right(bookingSessionDetailResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> confirmFreeBooking() async {
    try {
      final bookingSessionDetailResponse =
          await ticketBookingDataSource.confirmFreeBooking(
        bookingSession: await GetStorage().read(
          StringConst.isBookingSessionExistedKey,
        ),
      );
      return Right(bookingSessionDetailResponse);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
