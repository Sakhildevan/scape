// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'event_info_model.freezed.dart';
part 'event_info_model.g.dart';

EventInfoModel eventModelFromJson(String str) =>
    EventInfoModel.fromJson(json.decode(str));

String eventModelToJson(EventInfoModel data) => json.encode(data.toJson());

@freezed
class EventInfoModel with _$EventInfoModel {
  const factory EventInfoModel({
    EventSettings? eventSettings,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _EventInfoModel;

  factory EventInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EventInfoModelFromJson(json);
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
    List<EventPackage>? EventPackages,
  }) = _EventSettings;

  factory EventSettings.fromJson(Map<String, dynamic> json) =>
      _$EventSettingsFromJson(json);
}

@freezed
class EventPackage with _$EventPackage {
  const factory EventPackage({
    String? EventPackageCode,
    String? PackageName,
    String? PackageDescription,
    String? Price,
    String? PackageStatus,
    String? PackageStatusMessage,
    List<String>? Venues,
  }) = _EventPackage;

  factory EventPackage.fromJson(Map<String, dynamic> json) =>
      _$EventPackageFromJson(json);
}
