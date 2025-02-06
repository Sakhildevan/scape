import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/registration/data/data_source/registration_data_source.dart';
import 'package:scape/src/registration/data/model/login-model/login_with_email_model.dart';
import 'package:scape/src/registration/data/model/otp-verified-model/otp_verified_model.dart';
import 'package:scape/src/registration/data/model/registration-model/register_with_email_model.dart';

class RegistrationRepository {
  final RegistrationDataSource _registrationDataSource;
  RegistrationRepository(
      {required RegistrationDataSource registrationDataSource})
      : _registrationDataSource = registrationDataSource;
  ResultFuture<LoginWithEmailModel> loginWithEmail({
    required String userEmail,
  }) async {
    try {
      final result =
          await _registrationDataSource.loginWithEmail(email: userEmail);
      logger.d("LoginResponse: $result");
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<RegisterWithEmailModel> registerWithEmail({
    required String userEmail,
    required String userFirstName,
    required String userLastName,
    required int marketingConsent,
  }) async {
    try {
      final result = await _registrationDataSource.registerWithEmail(
        email: userEmail,
        firstName: userFirstName,
        lastName: userLastName,
        marketingConsent: marketingConsent,
      );
      logger.d("RegisterResponse: $result");
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<OtpVerifiedModel> confirmOtp({
    required String tempLoginToken,
    required String otp,
  }) async {
    try {
      final result = await _registrationDataSource.confirmOtp(
          tempLoginToken: tempLoginToken, loginOtp: otp);
      logger.d("OTP Verified Response: $result");
      // await GetStorage().remove(StringConst.isBookingSessionExistedKey);
      //Store Login TOken
      await GetStorage()
          .write(StringConst.loginTokenKey, result.loginDetails?.LoginToken);
      //!------------set cookie on browser
      // if (kIsWeb) {
      //   setCookie(StringConst.scapeLoggedIn, value);
      // }
      logger.d("LoginToken Stored");
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  //checkLoginIsValid API
  ResultFuture<CommonModel> checkLoginIsValid() async {
    try {
      final result = await _registrationDataSource.checkLoginIsValid();
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
