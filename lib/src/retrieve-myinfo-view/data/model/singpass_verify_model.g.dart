// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singpass_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingPassVerifyModelImpl _$$SingPassVerifyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SingPassVerifyModelImpl(
      singPassValidateRedirectDetails:
          json['singPassValidateRedirectDetails'] == null
              ? null
              : SingPassValidateRedirectDetails.fromJson(
                  json['singPassValidateRedirectDetails']
                      as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$SingPassVerifyModelImplToJson(
        _$SingPassVerifyModelImpl instance) =>
    <String, dynamic>{
      'singPassValidateRedirectDetails':
          instance.singPassValidateRedirectDetails,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$SingPassValidateRedirectDetailsImpl
    _$$SingPassValidateRedirectDetailsImplFromJson(Map<String, dynamic> json) =>
        _$SingPassValidateRedirectDetailsImpl(
          LoginToken: json['LoginToken'] as String?,
          EventCode: json['EventCode'] as String?,
          IsMyInfoVerified: json['IsMyInfoVerified'] as String?,
        );

Map<String, dynamic> _$$SingPassValidateRedirectDetailsImplToJson(
        _$SingPassValidateRedirectDetailsImpl instance) =>
    <String, dynamic>{
      'LoginToken': instance.LoginToken,
      'EventCode': instance.EventCode,
      'IsMyInfoVerified': instance.IsMyInfoVerified,
    };
