import 'package:dartz/dartz.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/utils/common-model/common_model.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/profile/data/data_source/profile_data_source.dart';
import 'package:scape/src/profile/data/model/edit_name_model/edit_name_model.dart';
import 'package:scape/src/profile/data/model/update-email/update_email_model.dart';

import '../model/my_tickets_model/my_tickets_model.dart';
import '../model/profile_model/profile_model.dart';

class ProfileRepository {
  final ProfileDataSource _profileDataSource;
  ProfileRepository({required ProfileDataSource profileDateSource})
      : _profileDataSource = profileDateSource;

  ResultFuture<MyTicketsModel> getMyTickets() async {
    try {
      final response = await _profileDataSource.getMyTickets();
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<EditName> editName(String firstName, String lastName) async {
    try {
      final response = await _profileDataSource.editName(firstName, lastName);
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> updateMyProfileMarketingConsent(
      int marketingConsent) async {
    try {
      final response = await _profileDataSource
          .updateMyProfileMarketingConsent(marketingConsent);
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<UpdateEmailModel> editEmail(
    String email,
  ) async {
    try {
      final response = await _profileDataSource.editEmail(
        email,
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> updateEmailFinalize(
    String tempToken,
    String otp,
  ) async {
    try {
      final response = await _profileDataSource.updateEmailFinalize(
        tempToken,
        otp,
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<ProfileModel> getProfileData() async {
    try {
      final response = await _profileDataSource.getProfile();
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> myInterestUpdateStatus(
    String interestCode,
    String status,
  ) async {
    try {
      final response = await _profileDataSource.myInterestUpdateStatus(
        interestCode,
        status,
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> myProfileAddMoreInterest(
    String moreInterestName,
  ) async {
    try {
      final response = await _profileDataSource.myProfileAddMoreInterest(
        moreInterestName,
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<CommonModel> myProfileDeleteMoreInterest(
    String moreInterestCode,
  ) async {
    try {
      final response = await _profileDataSource.myProfileDeleteMoreInterest(
        moreInterestCode,
      );
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  //checkLoginIsValid API
  ResultFuture<CommonModel> checkLoginIsValid() async {
    try {
      final result = await _profileDataSource.checkLoginIsValid();
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
