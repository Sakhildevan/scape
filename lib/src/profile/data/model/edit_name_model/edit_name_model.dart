// To parse this JSON data, do
//
//     final editName = editNameFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'edit_name_model.freezed.dart';
part 'edit_name_model.g.dart';

EditName editNameFromJson(String str) => EditName.fromJson(json.decode(str));

String editNameToJson(EditName data) => json.encode(data.toJson());

@freezed
class EditName with _$EditName {
  const factory EditName({
    @JsonKey(name: "IsSuccess") String? isSuccess,
    @JsonKey(name: "ErrorOnFailure") String? errorOnFailure,
  }) = _EditName;

  factory EditName.fromJson(Map<String, dynamic> json) =>
      _$EditNameFromJson(json);
}
