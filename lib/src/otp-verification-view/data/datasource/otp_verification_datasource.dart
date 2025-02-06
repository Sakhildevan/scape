import 'package:get_storage/get_storage.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/core/utils/string_constants.dart';

class OtpVerificationDataSource {
  final APIHelper _apiHelper;

  OtpVerificationDataSource(this._apiHelper);

  Future<CommonModel> checkSingPassVerification() async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.checkSingPassVerificationEndpoints,
        method: Method.POST,
        loginToken: loginToken,
      );
      logger.d("CheckSingPassVerification ==> $response");
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

  Future<CommonModel> myProfileUpdateQuiz() async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    final wayToSuccessful =
        await GetStorage().read(StringConst.wayToSuccessfulKey);
    final findOpportunities =
        await GetStorage().read(StringConst.findOpportunitiesKey);
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.myProfileUpdateQuiz,
        method: Method.POST,
        loginToken: loginToken,
        params: {
          "Quiz_Rate_Many_Ways_To_Be_Successful": wayToSuccessful,
          "Quiz_Rate_I_Know_How_To_Find_Opportunities": findOpportunities
        },
      );
      logger.d("myProfileUpdateQuiz ==> $response");
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
