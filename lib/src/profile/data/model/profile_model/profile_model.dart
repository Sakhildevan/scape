// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @JsonKey(name: "MemberCode") String? memberCode,
    @JsonKey(name: "JoinedOn") String? joinedOn,
    @JsonKey(name: "Email") String? email,
    @JsonKey(name: "FirstName") String? firstName,
    @JsonKey(name: "LastName") String? lastName,
    @JsonKey(name: "IsMyInfoVarified") String? isMyInfoVarified,
    @JsonKey(name: "IsSuccess") String? isSuccess,
    @JsonKey(name: "ErrorOnFailure") String? errorOnFailure,
    @JsonKey(name: "MarketingConsent") int? marketingConsent,
    @JsonKey(name: "Quiz_Rate_Many_Ways_To_Be_Successful")
    int? quizRateManyWaysToBeSuccessful,
    @JsonKey(name: "Quiz_Rate_I_Know_How_To_Find_Opportunities")
    int? quizRateIKnowHowToFindOpportunities,
    @JsonKey(name: "Interests") List<Interest>? interests,
    @JsonKey(name: "MoreInterests") List<MoreInterest>? moreInterests,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class Interest with _$Interest {
  const factory Interest({
    @JsonKey(name: "InterestCode") String? interestCode,
    @JsonKey(name: "InterestName") String? interestName,
    @JsonKey(name: "IsSelected") String? isSelected,
  }) = _Interest;

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);
}

@freezed
class MoreInterest with _$MoreInterest {
  const factory MoreInterest({
    @JsonKey(name: "MoreInterestCode") String? moreInterestCode,
    @JsonKey(name: "MoreInterestName") String? moreInterestName,
  }) = _MoreInterest;

  factory MoreInterest.fromJson(Map<String, dynamic> json) =>
      _$MoreInterestFromJson(json);
}
