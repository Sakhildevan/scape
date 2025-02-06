import 'package:dartz/dartz.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/otp-verification-view/data/datasource/otp_verification_datasource.dart';

class OtpVerificationRepository {
  final OtpVerificationDataSource _otpVerificationDataSource;

  OtpVerificationRepository(
      {required OtpVerificationDataSource otpVerificationDataSource})
      : _otpVerificationDataSource = otpVerificationDataSource;

  //CheckSingPassVerification API
  ResultFuture<CommonModel> checkSingPassVerification() async {
    try {
      final result =
          await _otpVerificationDataSource.checkSingPassVerification();
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
