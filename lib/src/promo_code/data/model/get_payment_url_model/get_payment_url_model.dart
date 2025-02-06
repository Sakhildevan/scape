// To parse this JSON data, do
//
//     final getPaymentUrlModel = getPaymentUrlModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_payment_url_model.freezed.dart';
part 'get_payment_url_model.g.dart';

GetPaymentUrlModel getPaymentUrlModelFromJson(String str) => GetPaymentUrlModel.fromJson(json.decode(str));

String getPaymentUrlModelToJson(GetPaymentUrlModel data) => json.encode(data.toJson());

@freezed
class GetPaymentUrlModel with _$GetPaymentUrlModel {
  const factory GetPaymentUrlModel({
    String? PaymentRedirectURL,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _GetPaymentUrlModel;

  factory GetPaymentUrlModel.fromJson(Map<String, dynamic> json) => _$GetPaymentUrlModelFromJson(json);
}
