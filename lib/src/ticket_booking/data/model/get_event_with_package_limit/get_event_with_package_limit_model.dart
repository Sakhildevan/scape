// To parse this JSON data, do
//
//     final getEventWithPackageLimitModel = getEventWithPackageLimitModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_event_with_package_limit_model.freezed.dart';
part 'get_event_with_package_limit_model.g.dart';

GetEventWithPackageLimitModel getEventWithPackageLimitModelFromJson(
        String str) =>
    GetEventWithPackageLimitModel.fromJson(json.decode(str));

String getEventWithPackageLimitModelToJson(
        GetEventWithPackageLimitModel data) =>
    json.encode(data.toJson());

@freezed
class GetEventWithPackageLimitModel with _$GetEventWithPackageLimitModel {
  const factory GetEventWithPackageLimitModel({
    EventSettings? eventSettings,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _GetEventWithPackageLimitModel;

  factory GetEventWithPackageLimitModel.fromJson(Map<String, dynamic> json) =>
      _$GetEventWithPackageLimitModelFromJson(json);
}

@freezed
class EventSettings with _$EventSettings {
  const factory EventSettings({
    String? EventCode,
    String? EventName,
    String? EventDescription,
    String? BannerURL,
    String? MustUseMyInfo,
    String? MustUseMyInfoMessage,
    String? BookingChannel,
    List<EventPackageWithLimit>? EventPackages,
  }) = _EventSettings;

  factory EventSettings.fromJson(Map<String, dynamic> json) =>
      _$EventSettingsFromJson(json);
}

@freezed
class EventPackageWithLimit with _$EventPackageWithLimit {
  const factory EventPackageWithLimit({
    String? EventPackageCode,
    String? PackageName,
    String? PackageDescription,
    String? Price,
    String? PackageStatus,
    String? PackageStatusMessage,
    int? PackageLimit,
    int? UserRestriction,
    String? UserRestrictionDetails,
    List<String>? Venues,
  }) = _EventPackageWithLimit;

  factory EventPackageWithLimit.fromJson(Map<String, dynamic> json) =>
      _$EventPackageWithLimitFromJson(json);
}
