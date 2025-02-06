// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginWithEmailModelImpl _$$LoginWithEmailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginWithEmailModelImpl(
      loginDetailsForOTP: json['loginDetailsForOTP'] == null
          ? null
          : LoginDetailsForOtp.fromJson(
              json['loginDetailsForOTP'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$LoginWithEmailModelImplToJson(
        _$LoginWithEmailModelImpl instance) =>
    <String, dynamic>{
      'loginDetailsForOTP': instance.loginDetailsForOTP,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$LoginDetailsForOtpImpl _$$LoginDetailsForOtpImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginDetailsForOtpImpl(
      TempLoginToken: json['TempLoginToken'] as String?,
    );

Map<String, dynamic> _$$LoginDetailsForOtpImplToJson(
        _$LoginDetailsForOtpImpl instance) =>
    <String, dynamic>{
      'TempLoginToken': instance.TempLoginToken,
    };
