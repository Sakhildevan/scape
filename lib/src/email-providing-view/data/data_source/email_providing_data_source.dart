import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/data/model/member-exist-model/member_exist_model.dart';

class EmailProvidingDataSource {
  final APIHelper _apiHelper;

  EmailProvidingDataSource(this._apiHelper);

  Future<EventInfoModel> getEvent(String eventKey) async {
    try {
      final response = await _apiHelper.request(
        url: "${APIEndpoints.getEventEndpoints}?event=$eventKey",
        method: Method.GET,
      );
      logger.d("EventInfo ==> $response");
      final result = EventInfoModel.fromJson(response.data);
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

  Future<MemberExistModel> checkMemberExists(String email) async {
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.checkMemberExistsEndpoints,
        method: Method.POST,
        params: {
          "Email": email,
        },
      );
      logger.d("CheckMemberExists ==> $response");
      final result = MemberExistModel.fromJson(response.data);
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

  Future<CommonModel> checkMemberIsActive(String email) async {
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.checkMemberIsActiveEndpoints,
        method: Method.POST,
        params: {
          "Email": email,
        },
      );
      logger.d("CheckMemberIsActive ==> $response");
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
