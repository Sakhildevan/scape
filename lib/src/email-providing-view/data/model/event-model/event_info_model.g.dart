// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventInfoModelImpl _$$EventInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$EventInfoModelImpl(
      eventSettings: json['eventSettings'] == null
          ? null
          : EventSettings.fromJson(
              json['eventSettings'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$EventInfoModelImplToJson(
        _$EventInfoModelImpl instance) =>
    <String, dynamic>{
      'eventSettings': instance.eventSettings,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$EventSettingsImpl _$$EventSettingsImplFromJson(Map<String, dynamic> json) =>
    _$EventSettingsImpl(
      EventCode: json['EventCode'] as String?,
      EventName: json['EventName'] as String?,
      EventDescription: json['EventDescription'] as String?,
      BannerURL: json['BannerURL'] as String?,
      MustUseMyInfo: json['MustUseMyInfo'] as String?,
      MustUseMyInfoMessage: json['MustUseMyInfoMessage'] as String?,
      BookingChannel: json['BookingChannel'] as String?,
      EventPackages: (json['EventPackages'] as List<dynamic>?)
          ?.map((e) => EventPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventSettingsImplToJson(_$EventSettingsImpl instance) =>
    <String, dynamic>{
      'EventCode': instance.EventCode,
      'EventName': instance.EventName,
      'EventDescription': instance.EventDescription,
      'BannerURL': instance.BannerURL,
      'MustUseMyInfo': instance.MustUseMyInfo,
      'MustUseMyInfoMessage': instance.MustUseMyInfoMessage,
      'BookingChannel': instance.BookingChannel,
      'EventPackages': instance.EventPackages,
    };

_$EventPackageImpl _$$EventPackageImplFromJson(Map<String, dynamic> json) =>
    _$EventPackageImpl(
      EventPackageCode: json['EventPackageCode'] as String?,
      PackageName: json['PackageName'] as String?,
      PackageDescription: json['PackageDescription'] as String?,
      Price: json['Price'] as String?,
      PackageStatus: json['PackageStatus'] as String?,
      PackageStatusMessage: json['PackageStatusMessage'] as String?,
      Venues:
          (json['Venues'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$EventPackageImplToJson(_$EventPackageImpl instance) =>
    <String, dynamic>{
      'EventPackageCode': instance.EventPackageCode,
      'PackageName': instance.PackageName,
      'PackageDescription': instance.PackageDescription,
      'Price': instance.Price,
      'PackageStatus': instance.PackageStatus,
      'PackageStatusMessage': instance.PackageStatusMessage,
      'Venues': instance.Venues,
    };
