// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaticPageModelImpl _$$StaticPageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StaticPageModelImpl(
      staticPage: json['StaticPage'] as String?,
      isSuccess: json['IsSuccess'] as String?,
      errorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$StaticPageModelImplToJson(
        _$StaticPageModelImpl instance) =>
    <String, dynamic>{
      'StaticPage': instance.staticPage,
      'IsSuccess': instance.isSuccess,
      'ErrorOnFailure': instance.errorOnFailure,
    };
