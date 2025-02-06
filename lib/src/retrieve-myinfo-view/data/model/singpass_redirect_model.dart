// To parse this JSON data, do
//
//     final singPassRedirectModel = singPassRedirectModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'singpass_redirect_model.freezed.dart';
part 'singpass_redirect_model.g.dart';

SingPassRedirectModel singPassRedirectModelFromJson(String str) => SingPassRedirectModel.fromJson(json.decode(str));

String singPassRedirectModelToJson(SingPassRedirectModel data) => json.encode(data.toJson());

@freezed
class SingPassRedirectModel with _$SingPassRedirectModel {
    const factory SingPassRedirectModel({
        SingPassRedirectDetails? singPassRedirectDetails,
        String? IsSuccess,
        String? ErrorOnFailure,
    }) = _SingPassRedirectModel;

    factory SingPassRedirectModel.fromJson(Map<String, dynamic> json) => _$SingPassRedirectModelFromJson(json);
}

@freezed
class SingPassRedirectDetails with _$SingPassRedirectDetails {
    const factory SingPassRedirectDetails({
        String? RedirectURL,
    }) = _SingPassRedirectDetails;

    factory SingPassRedirectDetails.fromJson(Map<String, dynamic> json) => _$SingPassRedirectDetailsFromJson(json);
}
