import 'package:dartz/dartz.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/email-providing-view/data/data_source/email_providing_data_source.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/data/model/member-exist-model/member_exist_model.dart';

class EmailProvidingRepository {
  final EmailProvidingDataSource _emailProvidingDataSource;

  EmailProvidingRepository(
      {required EmailProvidingDataSource emailProvidingDataSource})
      : _emailProvidingDataSource = emailProvidingDataSource;

  //Get Event API
  ResultFuture<EventInfoModel> getEvent() async {
    try {
      String storedEventKey = await StringConst.eventKey.readFromGetStorage();

      final result = await _emailProvidingDataSource.getEvent(storedEventKey);

      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  //CheckMemberExists API
  ResultFuture<MemberExistModel> checkMemberExists(String email) async {
    try {
      final result = await _emailProvidingDataSource.checkMemberExists(email);
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  //CheckMemberIsActive API
  ResultFuture<CommonModel> checkMemberIsActive(String email) async {
    try {
      final result = await _emailProvidingDataSource.checkMemberIsActive(email);
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
