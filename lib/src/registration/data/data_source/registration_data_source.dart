import 'package:get_storage/get_storage.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/registration/data/model/login-model/login_with_email_model.dart';
import 'package:scape/src/registration/data/model/otp-verified-model/otp_verified_model.dart';
import 'package:scape/src/registration/data/model/registration-model/register_with_email_model.dart';

class RegistrationDataSource {
  final APIHelper _apiHelper;
  RegistrationDataSource(this._apiHelper);
  Future<LoginWithEmailModel> loginWithEmail({required String email}) async {
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.loginWithEmailEndpoints,
          method: Method.POST,
          params: {
            "Email": email,
            "DeviceID": "Sample Data",
            "PushToken": "Sample Data",
            "DeviceOS": "Sample Data",
            "DeviceOSVersion": "Sample Data",
            "AppVersion": "Sample Data",
            "DeviceType": "Sample Data",
            "DeviceName": "Sample Data"
          });
      logger.d("LoginWithEmailResponse ==> $response");
      final result = LoginWithEmailModel.fromJson(response.data);

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

  Future<RegisterWithEmailModel> registerWithEmail({
    required String email,
    required String firstName,
    required String lastName,
    required int marketingConsent,
  }) async {
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.registerWithEmailEndpoints,
          method: Method.POST,
          params: {
            "Email": email,
            "FirstName": firstName,
            "LastName": lastName,
            "DeviceID": "Sample Data",
            "PushToken": "Sample Data",
            "DeviceOS": "Sample Data",
            "DeviceOSVersion": "Sample Data",
            "AppVersion": "Sample Data",
            "DeviceType": "Sample Data",
            "DeviceName": "Sample Data",
            "MarketingConsent": marketingConsent,
          });

      final result = RegisterWithEmailModel.fromJson(response.data);
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

  Future<OtpVerifiedModel> confirmOtp({
    required String tempLoginToken,
    required String loginOtp,
  }) async {
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.confirmOtpEndpoints,
          method: Method.POST,
          params: {
            "TempLoginToken": tempLoginToken,
            "LoginOTP": loginOtp,
          });

      final result = OtpVerifiedModel.fromJson(response.data);
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

  Future<CommonModel> checkLoginIsValid() async {
    try {
      String loginKey = await GetStorage().read(StringConst.loginTokenKey);
      final response = await _apiHelper.request(
        url: APIEndpoints.checkLoginIsValidEndpoint,
        method: Method.POST,
        loginToken: loginKey,
      );
      logger.d("CheckLoginIsValid Response ==> $response");
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
