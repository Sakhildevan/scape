// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateEmailModelImpl _$$UpdateEmailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateEmailModelImpl(
      TempToken: json['TempToken'] as String?,
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$UpdateEmailModelImplToJson(
        _$UpdateEmailModelImpl instance) =>
    <String, dynamic>{
      'TempToken': instance.TempToken,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };
