import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';
import 'package:scape/src/ticket_booking/data/model/create_new_session/create_new_session_model.dart';
import 'package:scape/src/ticket_booking/data/model/get_event_with_package_limit/get_event_with_package_limit_model.dart';

import '../../../../core/utils/common-model/common_model.dart';
import '../../../promo_code/data/model/free_booking_model/is_free_booking_model.dart';

class TicketBookingDataSource {
  final APIHelper _apiHelper;

  TicketBookingDataSource(this._apiHelper);

  Future<CreateNewSessionModel> createBookingSession() async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final eventKey = await GetStorage().read(StringConst.eventKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionCreate,
          method: Method.POST,
          params: {"EventCode": eventKey},
          loginToken: loginToken);
      logger.d("CreateNewSession ==> $response");
      final result = CreateNewSessionModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> bookingSessionMultipleTicketAdd(
    List<Map<String, dynamic>> packageToAdd,
  ) async {
    try {
      final loginToken = await GetStorage().read(
        StringConst.loginTokenKey,
      );
      final bookingSession = await GetStorage().read(
        StringConst.isBookingSessionExistedKey,
      );
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionMultipleTicketAdd,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
            "packagesToAdd": List.generate(packageToAdd.length, (index) {
              return {
                StringConst.eventPackageCodeKey: packageToAdd[index]
                    [StringConst.eventPackageCodeKey],
                StringConst.numberOfTicketsKey: packageToAdd[index]
                    [StringConst.numberOfTicketsKey],
              };
            }).toList(),
          },
          loginToken: loginToken);
      logger.d("bookingSessionMultipleTicketAdd ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> bookingSessionPackageAddDummy(
    String eventPackageCode,
  ) async {
    try {
      final loginToken = await GetStorage().read(
        StringConst.loginTokenKey,
      );
      final bookingSession = await GetStorage().read(
        StringConst.isBookingSessionExistedKey,
      );
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionPackageAddDummy,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
            "EventPackageCode": eventPackageCode,
          },
          loginToken: loginToken);
      logger.d("bookingSessionPackageAddDummy ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> deleteParticipant(
    String participantCode,
  ) async {
    try {
      final loginToken = await GetStorage().read(
        StringConst.loginTokenKey,
      );
      final bookingSession = await GetStorage().read(
        StringConst.isBookingSessionExistedKey,
      );
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionDeletePackage,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
            "ParticipantCode": participantCode,
          },
          loginToken: loginToken);
      logger.d("bookingSessionDeletePackage ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> bookingSessionPackageUpdate(
    String participantCode,
    String participantName,
    String participantEmail,
  ) async {
    try {
      final loginToken = await GetStorage().read(
        StringConst.loginTokenKey,
      );
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionPackageUpdate,
          method: Method.POST,
          params: {
            "ParticipantCode": participantCode,
            "ParticipantName": participantName,
            "ParticipantEmail": participantEmail,
          },
          loginToken: loginToken);
      logger.d("bookingSessionPackageUpdate ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> bookingSessionCheckAllParticipantsUpdated() async {
    try {
      final loginToken = await GetStorage().read(
        StringConst.loginTokenKey,
      );
      final bookingSession = await GetStorage().read(
        StringConst.isBookingSessionExistedKey,
      );
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionCheckAllParticipantsUpdated,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
          },
          loginToken: loginToken);
      logger.d("bookingSessionCheckAllParticipantsUpdated ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<GetEventWithPackageLimitModel> getEventWithPackageLimit() async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final eventKey = await GetStorage().read(StringConst.eventKey);
      final response = await _apiHelper.request(
        url: "${APIEndpoints.getEventWithLimitEndpoints}?event=$eventKey",
        method: Method.GET,
        loginToken: loginToken,
      );
      logger.d("EventInfo with package limit ==> $response");
      final result = GetEventWithPackageLimitModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<BookingSessionDetailModel> bookingSessionDetailApi(
      {required String bookingSession}) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      logger.e(loginToken);
      logger.e(bookingSession);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionGet,
          method: Method.POST,
          params: {"BookingSession": bookingSession},
          loginToken: loginToken);
      logger.d("BookingSessionDetail ==> $response");
      final result = BookingSessionDetailModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> addPackageIsAllowed({
    required String bookingSession,
    required String packageCode,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionAddPackageAllowed,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
            "EventPackageCode": packageCode
          },
          loginToken: loginToken);
      logger.d("addPackageIsAllowed ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> changeNameIsAllowed({
    required String bookingSession,
    required String packageCode,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionChangeNameAllowed,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
            "EventPackageCode": packageCode
          },
          loginToken: loginToken);
      logger.d("changeNameIsAllowed ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> addPackage({
    required String bookingSession,
    required String packageCode,
    required String name,
    required String email,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      var param = {
        "BookingSession": bookingSession,
        "EventPackageCode": packageCode,
        "ParticipantName": name,
        "ParticipantEmail": email
      };
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionAddPackage,
          method: Method.POST,
          params: param,
          loginToken: loginToken);
      logger.d("addPackage ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> deletePackage({
    required String bookingSession,
    required String participantCode,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      var param = {
        "BookingSession": bookingSession,
        "ParticipantCode": participantCode,
      };
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionDeletePackage,
          method: Method.POST,
          params: param,
          loginToken: loginToken);
      logger.d("deletePackage ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<IsBookingFreeModel> isFreeBooking({
    required String bookingSession,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      if (kDebugMode) {
        print("Login TOken $loginToken");
        print("Booking session $bookingSession");
      }
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionFreeBooking,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
          },
          loginToken: loginToken);
      logger.d("IsFreeBooking ==> $response");
      final result = IsBookingFreeModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<CommonModel> confirmFreeBooking({
    required String bookingSession,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionConfirmFreeBooking,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
          },
          loginToken: loginToken);
      logger.d("Confirm Booking ==> $response");
      final result = CommonModel.fromJson(response.data);
      if (result.IsSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.ErrorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
