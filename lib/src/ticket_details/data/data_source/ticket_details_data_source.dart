import 'package:get_storage/get_storage.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/src/ticket_details/model/dynamic_ticket_model/dynamic_ticket_model.dart';

import '../../../../config/network/api_helper.dart';
import '../../../../core/helper/logger.dart';
import '../../../../core/utils/api_endpoints.dart';
import '../../../../core/utils/string_constants.dart';
import '../../model/static_page_model/static_page_model.dart';
import '../../model/ticket_model/ticket_model.dart';

class TicketDetailsDataSource {
  final APIHelper _apiHelper;

  TicketDetailsDataSource(this._apiHelper);

  Future<TicketModel> getTicket(String ticketCode) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.getTicket(ticketCode),
          method: Method.GET,
          loginToken: loginToken);
      logger.d("Get my ==> $response");
      final result = TicketModel.fromJson(response.data);
      if (result.isSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.errorOnFailure ?? StringConst.somethingWentWrong,
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

  Future<DynamicTicketModel> getDynamicTicket(String referenceCode) async {
    try {
      final loginToken = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
          url: APIEndpoints.getDynamicTicket(referenceCode),
          method: Method.GET,
          loginToken: loginToken);
      logger.d("Get Dynamic Ticket ==> $response");
      final result = DynamicTicketModel.fromJson(response.data);
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

  Future<StaticPageModel> getStatic() async {
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.staticPage,
        method: Method.POST,
        params: {
          "StaticPageName": "Terms of Use",
        },
      );
      logger.d("Get my ==> $response");
      final result = StaticPageModel.fromJson(response.data);
      if (result.isSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.errorOnFailure ?? StringConst.somethingWentWrong,
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
