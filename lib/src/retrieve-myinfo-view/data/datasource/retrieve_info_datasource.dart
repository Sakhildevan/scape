import 'package:get_storage/get_storage.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/retrieve-myinfo-view/data/model/singpass_redirect_model.dart';
import 'package:scape/src/retrieve-myinfo-view/data/model/singpass_verify_model.dart';

class RetrieveInfoDataSource {
  final APIHelper _apiHelper;
  final box = GetStorage();

  RetrieveInfoDataSource(this._apiHelper);

  Future<SingPassRedirectModel> getRedirectUrl(String eventCode) async {
    try {
      String loginKey = await box.read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
        url: APIEndpoints.singPassRedirectionEndpoint,
        method: Method.POST,
        params: {"EventCode": eventCode},
        loginToken: loginKey,
      );
      logger.d("RedirectURL ==> $response");
      final result = SingPassRedirectModel.fromJson(response.data);
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

  Future<SingPassVerifyModel> validateSingpass(String token) async {
    try {
      String loginKey = await box.read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
        url: APIEndpoints.singPassVerifyEndpoint(token),
        method: Method.POST,
        loginToken: loginKey,
      );
      logger.d("ValidateSingPassResponse ==> $response");
      final result = SingPassVerifyModel.fromJson(response.data);
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
