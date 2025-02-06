// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_with_email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterWithEmailModelImpl _$$RegisterWithEmailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterWithEmailModelImpl(
      registrationDetailsForOTP: json['registrationDetailsForOTP'] == null
          ? null
          : RegistrationDetailsForOtp.fromJson(
              json['registrationDetailsForOTP'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$RegisterWithEmailModelImplToJson(
        _$RegisterWithEmailModelImpl instance) =>
    <String, dynamic>{
      'registrationDetailsForOTP': instance.registrationDetailsForOTP,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$RegistrationDetailsForOtpImpl _$$RegistrationDetailsForOtpImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationDetailsForOtpImpl(
      TempLoginToken: json['TempLoginToken'] as String?,
    );

Map<String, dynamic> _$$RegistrationDetailsForOtpImplToJson(
        _$RegistrationDetailsForOtpImpl instance) =>
    <String, dynamic>{
      'TempLoginToken': instance.TempLoginToken,
    };
