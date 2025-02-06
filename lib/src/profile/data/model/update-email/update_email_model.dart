// To parse this JSON data, do
//
//     final updateEmailModel = updateEmailModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_email_model.freezed.dart';
part 'update_email_model.g.dart';

UpdateEmailModel updateEmailModelFromJson(String str) =>
    UpdateEmailModel.fromJson(json.decode(str));

String updateEmailModelToJson(UpdateEmailModel data) =>
    json.encode(data.toJson());

@freezed
class UpdateEmailModel with _$UpdateEmailModel {
  const factory UpdateEmailModel({
    String? TempToken,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _UpdateEmailModel;

  factory UpdateEmailModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailModelFromJson(json);
}
