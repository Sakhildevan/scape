import 'package:get_storage/get_storage.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/src/profile/data/model/profile_model/profile_model.dart';
import 'package:scape/src/profile/data/model/update-email/update_email_model.dart';
import 'package:scape/src/ticket_details/model/profile_model_test.dart';

import '../../../../core/utils/string_constants.dart';
import '../model/edit_name_model/edit_name_model.dart';
import '../model/my_tickets_model/my_tickets_model.dart';

class ProfileDataSource {
  final APIHelper _apiHelper;
  // final box = GetStorage();

  ProfileDataSource(this._apiHelper);

  Future<MyTicketsModel> getMyTickets() async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.getMyTickets,
          method: Method.GET,
          loginToken: loginToken);
      logger.d("Get Ticktes ==> $response");
      final result = MyTicketsModel.fromJson(response.data);
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

  Future<EditName> editName(String firstName, String lastName) async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.postProfileName,
        method: Method.POST,
        params: {
          "FirstName": firstName,
          "LastName": lastName,
        },
        loginToken: loginToken,
      );
      logger.d("Edit name ==> $response");
      final result = EditName.fromJson(response.data);
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

  Future<CommonModel> updateMyProfileMarketingConsent(
      int marketingConsent) async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.updateMyProfileMarketingConsent,
        method: Method.POST,
        params: {
          "MarketingConsent": marketingConsent,
        },
        loginToken: loginToken,
      );
      logger.d("Update Marketing Consent ==> $response");
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

  Future<UpdateEmailModel> editEmail(
    String email,
  ) async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.updateEmail,
        method: Method.POST,
        params: {
          "NewEmail": email,
        },
        loginToken: loginToken,
      );
      logger.d("Edit email ==> $response");
      final result = UpdateEmailModel.fromJson(response.data);
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

  Future<CommonModel> updateEmailFinalize(
    String tempToken,
    String otp,
  ) async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.updateEmailFinalize,
        method: Method.POST,
        params: {
          "TempToken": tempToken,
          "OTP": otp,
        },
        loginToken: loginToken,
      );
      logger.d("updateEmailFinalize ==> $response");
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

  Future<ProfileModelTest> getProfileData() async {
    try {
      const response = ProfileModelTest(
          name: 'Mei Ling Ng',
          email: 'ling.ng@gmail.com',
          floor: '11',
          unit: '188',
          block: '690D',
          building: 'Woodlands GreenView',
          street: 'Woodlands Drive 75',
          postCode: '740690');

      return response; //Return the list using fromJson  } on APIException {
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<ProfileModel> getProfile() async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.getMyProfile,
          method: Method.GET,
          loginToken: loginToken);
      logger.d("Get profile ==> $response");
      final result = ProfileModel.fromJson(response.data);
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

  Future<CommonModel> myInterestUpdateStatus(
    String interestCode,
    String status,
  ) async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.myInterestUpdateStatus,
          method: Method.POST,
          params: {
            "InterestCode": interestCode,
            "Status": status,
          },
          loginToken: loginToken);
      logger.d("myInterestUpdateStatus ==> $response");
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

  Future<CommonModel> myProfileAddMoreInterest(
    String moreInterestName,
  ) async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.myProfileAddMoreInterest,
          method: Method.POST,
          params: {
            "MoreInterestName": moreInterestName,
          },
          loginToken: loginToken);
      logger.d("myProfileAddMoreInterest ==> $response");
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

  Future<CommonModel> myProfileDeleteMoreInterest(
    String moreInterestCode,
  ) async {
    final loginToken = await GetStorage().read(StringConst.loginTokenKey);
    try {
      final response = await _apiHelper.request(
          url: APIEndpoints.myProfileDeleteMoreInterest,
          method: Method.POST,
          params: {
            "MoreInterestCode": moreInterestCode,
          },
          loginToken: loginToken);
      logger.d("myProfileDeleteMoreInterest ==> $response");
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
