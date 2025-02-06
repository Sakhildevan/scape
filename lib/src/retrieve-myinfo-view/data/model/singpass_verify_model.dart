// To parse this JSON data, do
//
//     final singPassVerifyModel = singPassVerifyModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'singpass_verify_model.freezed.dart';
part 'singpass_verify_model.g.dart';

SingPassVerifyModel singPassVerifyModelFromJson(String str) => SingPassVerifyModel.fromJson(json.decode(str));

String singPassVerifyModelToJson(SingPassVerifyModel data) => json.encode(data.toJson());

@freezed
class SingPassVerifyModel with _$SingPassVerifyModel {
    const factory SingPassVerifyModel({
        SingPassValidateRedirectDetails? singPassValidateRedirectDetails,
        String? IsSuccess,
        String? ErrorOnFailure,
    }) = _SingPassVerifyModel;

    factory SingPassVerifyModel.fromJson(Map<String, dynamic> json) => _$SingPassVerifyModelFromJson(json);
}

@freezed
class SingPassValidateRedirectDetails with _$SingPassValidateRedirectDetails {
    const factory SingPassValidateRedirectDetails({
        String? LoginToken,
        String? EventCode,
        String? IsMyInfoVerified,
    }) = _SingPassValidateRedirectDetails;

    factory SingPassValidateRedirectDetails.fromJson(Map<String, dynamic> json) => _$SingPassValidateRedirectDetailsFromJson(json);
}
