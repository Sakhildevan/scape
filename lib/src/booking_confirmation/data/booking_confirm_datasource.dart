import 'package:get_storage/get_storage.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/booking_confirmation/data/model/ticket_from_booking_session.dart';

import '../../ticket_booking/data/model/booking_session_detail/booking_session_detail_model.dart';

class BookingConfirmDatasource {
  final APIHelper _apiHelper;

  BookingConfirmDatasource(this._apiHelper);

  Future<BookingSessionDetailModel> bookingSessionDetailApi() async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final bookingSession =
          await GetStorage().read(StringConst.isBookingSessionExistedKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.bookingSessionGet,
          method: Method.POST,
          params: {"BookingSession": bookingSession},
          loginToken: loginToken);
      logger.d("BookingSessionDetail from Confirmation  ==> $response");
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

  Future<TicketFromBookingSession> getTicketCodeByBookingSessionApi() async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final bookingSession =
          await GetStorage().read(StringConst.isBookingSessionExistedKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.getTicketFromBookingSession,
          method: Method.POST,
          params: {"BookingSession": bookingSession},
          loginToken: loginToken);
      logger.d(" getTicketCodeByBookingSessionApi ==> $response");
      final result = TicketFromBookingSession.fromJson(response.data);
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
