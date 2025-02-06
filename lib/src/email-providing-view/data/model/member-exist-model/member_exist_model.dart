// To parse this JSON data, do
//
//     final memberExistModel = memberExistModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'member_exist_model.freezed.dart';
part 'member_exist_model.g.dart';

MemberExistModel memberExistModelFromJson(String str) =>
    MemberExistModel.fromJson(json.decode(str));

String memberExistModelToJson(MemberExistModel data) =>
    json.encode(data.toJson());

@freezed
class MemberExistModel with _$MemberExistModel {
  const factory MemberExistModel({
    String? IsSuccess,
    String? IsMemberExists,
    String? ErrorOnFailure,
  }) = _MemberExistModel;

  factory MemberExistModel.fromJson(Map<String, dynamic> json) =>
      _$MemberExistModelFromJson(json);
}
