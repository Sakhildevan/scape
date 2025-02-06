import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/retrieve-myinfo-view/data/datasource/retrieve_info_datasource.dart';
import 'package:scape/src/retrieve-myinfo-view/data/model/singpass_redirect_model.dart';
import 'package:scape/src/retrieve-myinfo-view/data/model/singpass_verify_model.dart';

class RetrieveInfoRepository {
  final RetrieveInfoDataSource _retrieveInfoDataSource;

  RetrieveInfoRepository(
      {required RetrieveInfoDataSource retrieveInfoDataSource})
      : _retrieveInfoDataSource = retrieveInfoDataSource;

  //Get Redirect URL API
  ResultFuture<SingPassRedirectModel> getRedirectUrl() async {
    try {
      final eventKey = await GetStorage().read(StringConst.eventKey);
      final result = await _retrieveInfoDataSource.getRedirectUrl(eventKey);
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  //Get SingPass Verificatoin API
  ResultFuture<SingPassVerifyModel> validateSingpass(String token) async {
    try {
      final result = await _retrieveInfoDataSource.validateSingpass(token);
      await GetStorage().write(StringConst.loginTokenKey,
          result.singPassValidateRedirectDetails?.LoginToken);
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
