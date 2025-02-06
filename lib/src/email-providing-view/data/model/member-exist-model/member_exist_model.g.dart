// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_exist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberExistModelImpl _$$MemberExistModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberExistModelImpl(
      IsSuccess: json['IsSuccess'] as String?,
      IsMemberExists: json['IsMemberExists'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$MemberExistModelImplToJson(
        _$MemberExistModelImpl instance) =>
    <String, dynamic>{
      'IsSuccess': instance.IsSuccess,
      'IsMemberExists': instance.IsMemberExists,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };
