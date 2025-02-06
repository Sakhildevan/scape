// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verified_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpVerifiedModelImpl _$$OtpVerifiedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpVerifiedModelImpl(
      loginDetails: json['loginDetails'] == null
          ? null
          : LoginDetails.fromJson(json['loginDetails'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$OtpVerifiedModelImplToJson(
        _$OtpVerifiedModelImpl instance) =>
    <String, dynamic>{
      'loginDetails': instance.loginDetails,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$LoginDetailsImpl _$$LoginDetailsImplFromJson(Map<String, dynamic> json) =>
    _$LoginDetailsImpl(
      LoginToken: json['LoginToken'] as String?,
    );

Map<String, dynamic> _$$LoginDetailsImplToJson(_$LoginDetailsImpl instance) =>
    <String, dynamic>{
      'LoginToken': instance.LoginToken,
    };
