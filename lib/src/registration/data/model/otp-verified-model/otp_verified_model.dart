// To parse this JSON data, do
//
//     final otpVerifiedModel = otpVerifiedModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'otp_verified_model.freezed.dart';
part 'otp_verified_model.g.dart';

OtpVerifiedModel otpVerifiedModelFromJson(String str) =>
    OtpVerifiedModel.fromJson(json.decode(str));

String otpVerifiedModelToJson(OtpVerifiedModel data) =>
    json.encode(data.toJson());

@freezed
class OtpVerifiedModel with _$OtpVerifiedModel {
  const factory OtpVerifiedModel({
    LoginDetails? loginDetails,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _OtpVerifiedModel;

  factory OtpVerifiedModel.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifiedModelFromJson(json);
}

@freezed
class LoginDetails with _$LoginDetails {
  const factory LoginDetails({
    String? LoginToken,
  }) = _LoginDetails;

  factory LoginDetails.fromJson(Map<String, dynamic> json) =>
      _$LoginDetailsFromJson(json);
}
