// To parse this JSON data, do
//
//     final loginWithEmailModel = loginWithEmailModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_with_email_model.freezed.dart';
part 'login_with_email_model.g.dart';

LoginWithEmailModel loginWithEmailModelFromJson(String str) =>
    LoginWithEmailModel.fromJson(json.decode(str));

String loginWithEmailModelToJson(LoginWithEmailModel data) =>
    json.encode(data.toJson());

@freezed
class LoginWithEmailModel with _$LoginWithEmailModel {
  const factory LoginWithEmailModel({
    LoginDetailsForOtp? loginDetailsForOTP,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _LoginWithEmailModel;

  factory LoginWithEmailModel.fromJson(Map<String, dynamic> json) =>
      _$LoginWithEmailModelFromJson(json);
}

@freezed
class LoginDetailsForOtp with _$LoginDetailsForOtp {
  const factory LoginDetailsForOtp({
    String? TempLoginToken,
  }) = _LoginDetailsForOtp;

  factory LoginDetailsForOtp.fromJson(Map<String, dynamic> json) =>
      _$LoginDetailsForOtpFromJson(json);
}
