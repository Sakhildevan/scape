// To parse this JSON data, do
//
//     final registerWithEmailModel = registerWithEmailModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'register_with_email_model.freezed.dart';
part 'register_with_email_model.g.dart';

RegisterWithEmailModel registerWithEmailModelFromJson(String str) =>
    RegisterWithEmailModel.fromJson(json.decode(str));

String registerWithEmailModelToJson(RegisterWithEmailModel data) =>
    json.encode(data.toJson());

@freezed
class RegisterWithEmailModel with _$RegisterWithEmailModel {
  const factory RegisterWithEmailModel({
    RegistrationDetailsForOtp? registrationDetailsForOTP,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _RegisterWithEmailModel;

  factory RegisterWithEmailModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterWithEmailModelFromJson(json);
}

@freezed
class RegistrationDetailsForOtp with _$RegistrationDetailsForOtp {
  const factory RegistrationDetailsForOtp({
    String? TempLoginToken,
  }) = _RegistrationDetailsForOtp;

  factory RegistrationDetailsForOtp.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDetailsForOtpFromJson(json);
}
