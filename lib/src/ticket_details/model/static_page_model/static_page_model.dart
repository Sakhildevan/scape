// To parse this JSON data, do
//
//     final staticPageModel = staticPageModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'static_page_model.freezed.dart';
part 'static_page_model.g.dart';

StaticPageModel staticPageModelFromJson(String str) =>
    StaticPageModel.fromJson(json.decode(str));

String staticPageModelToJson(StaticPageModel data) =>
    json.encode(data.toJson());

@freezed
class StaticPageModel with _$StaticPageModel {
  const factory StaticPageModel({
    @JsonKey(name: "StaticPage") String? staticPage,
    @JsonKey(name: "IsSuccess") String? isSuccess,
    @JsonKey(name: "ErrorOnFailure") String? errorOnFailure,
  }) = _StaticPageModel;

  factory StaticPageModel.fromJson(Map<String, dynamic> json) =>
      _$StaticPageModelFromJson(json);
}
