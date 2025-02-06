// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singpass_redirect_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingPassRedirectModelImpl _$$SingPassRedirectModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SingPassRedirectModelImpl(
      singPassRedirectDetails: json['singPassRedirectDetails'] == null
          ? null
          : SingPassRedirectDetails.fromJson(
              json['singPassRedirectDetails'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$SingPassRedirectModelImplToJson(
        _$SingPassRedirectModelImpl instance) =>
    <String, dynamic>{
      'singPassRedirectDetails': instance.singPassRedirectDetails,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$SingPassRedirectDetailsImpl _$$SingPassRedirectDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$SingPassRedirectDetailsImpl(
      RedirectURL: json['RedirectURL'] as String?,
    );

Map<String, dynamic> _$$SingPassRedirectDetailsImplToJson(
        _$SingPassRedirectDetailsImpl instance) =>
    <String, dynamic>{
      'RedirectURL': instance.RedirectURL,
    };
