import 'package:get_storage/get_storage.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/promo_code/data/model/payment_return_model/payment_return_model.dart';
import 'package:scape/src/ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';

import '../../../../core/utils/common-model/common_model.dart';
import '../model/free_booking_model/is_free_booking_model.dart';
import '../model/get_payment_url_model/get_payment_url_model.dart';

class PromoCodeDataSource {
  final APIHelper _apiHelper;

  PromoCodeDataSource(this._apiHelper);

  Future<BookingSessionDetailModel> bookingSessionDetailApi(
      {required String bookingSession}) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionGet,
          method: Method.POST,
          params: {"BookingSession": bookingSession},
          loginToken: loginToken);
      logger.d("BookingSessionDetail API ==> $response");
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

  Future<CommonModel> applyPromoCode({
    required String bookingSession,
    required String promoCode,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionPromoCode,
          method: Method.POST,
          params: {"BookingSession": bookingSession, "Promocode": promoCode},
          loginToken: loginToken);
      logger.d("PromoCode ==> $response");
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

  Future<CommonModel> removePromotion({
    required String bookingSession,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionRemovePromoCode,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
          },
          loginToken: loginToken);
      logger.d("PromoCode ==> $response");
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

  Future<GetPaymentUrlModel> getPaymentUrl({
    required String bookingSession,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionPaymentUrl,
          method: Method.POST,
          params: {
            "BookingSession": bookingSession,
          },
          loginToken: loginToken);
      logger.d("Payment Url ==> $response");
      final result = GetPaymentUrlModel.fromJson(response.data);
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

  Future<PaymentReturnModel> validatePaymentReturn({
    required String paymentReturnToken,
  }) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionValidatePayment,
          method: Method.POST,
          params: {"PaymentReturnToken": paymentReturnToken},
          loginToken: loginToken);
      logger.d("Validate Payment ==> $response");
      final result = PaymentReturnModel.fromJson(response.data);
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
