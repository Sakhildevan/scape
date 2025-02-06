// To parse this JSON data, do
//
//     final commonModel = commonModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'common_model.freezed.dart';
part 'common_model.g.dart';

CommonModel commonModelFromJson(String str) =>
    CommonModel.fromJson(json.decode(str));

String commonModelToJson(CommonModel data) => json.encode(data.toJson());

@freezed
class CommonModel with _$CommonModel {
  const factory CommonModel({
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _CommonModel;

  factory CommonModel.fromJson(Map<String, dynamic> json) =>
      _$CommonModelFromJson(json);
}
