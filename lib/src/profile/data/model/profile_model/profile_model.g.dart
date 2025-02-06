// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      memberCode: json['MemberCode'] as String?,
      joinedOn: json['JoinedOn'] as String?,
      email: json['Email'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      isMyInfoVarified: json['IsMyInfoVarified'] as String?,
      isSuccess: json['IsSuccess'] as String?,
      errorOnFailure: json['ErrorOnFailure'] as String?,
      marketingConsent: (json['MarketingConsent'] as num?)?.toInt(),
      quizRateManyWaysToBeSuccessful:
          (json['Quiz_Rate_Many_Ways_To_Be_Successful'] as num?)?.toInt(),
      quizRateIKnowHowToFindOpportunities:
          (json['Quiz_Rate_I_Know_How_To_Find_Opportunities'] as num?)?.toInt(),
      interests: (json['Interests'] as List<dynamic>?)
          ?.map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
      moreInterests: (json['MoreInterests'] as List<dynamic>?)
          ?.map((e) => MoreInterest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'MemberCode': instance.memberCode,
      'JoinedOn': instance.joinedOn,
      'Email': instance.email,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'IsMyInfoVarified': instance.isMyInfoVarified,
      'IsSuccess': instance.isSuccess,
      'ErrorOnFailure': instance.errorOnFailure,
      'MarketingConsent': instance.marketingConsent,
      'Quiz_Rate_Many_Ways_To_Be_Successful':
          instance.quizRateManyWaysToBeSuccessful,
      'Quiz_Rate_I_Know_How_To_Find_Opportunities':
          instance.quizRateIKnowHowToFindOpportunities,
      'Interests': instance.interests,
      'MoreInterests': instance.moreInterests,
    };

_$InterestImpl _$$InterestImplFromJson(Map<String, dynamic> json) =>
    _$InterestImpl(
      interestCode: json['InterestCode'] as String?,
      interestName: json['InterestName'] as String?,
      isSelected: json['IsSelected'] as String?,
    );

Map<String, dynamic> _$$InterestImplToJson(_$InterestImpl instance) =>
    <String, dynamic>{
      'InterestCode': instance.interestCode,
      'InterestName': instance.interestName,
      'IsSelected': instance.isSelected,
    };

_$MoreInterestImpl _$$MoreInterestImplFromJson(Map<String, dynamic> json) =>
    _$MoreInterestImpl(
      moreInterestCode: json['MoreInterestCode'] as String?,
      moreInterestName: json['MoreInterestName'] as String?,
    );

Map<String, dynamic> _$$MoreInterestImplToJson(_$MoreInterestImpl instance) =>
    <String, dynamic>{
      'MoreInterestCode': instance.moreInterestCode,
      'MoreInterestName': instance.moreInterestName,
    };
