// To parse this JSON data, do
//
//     final paymentReturnModel = paymentReturnModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'payment_return_model.freezed.dart';
part 'payment_return_model.g.dart';

PaymentReturnModel paymentReturnModelFromJson(String str) =>
    PaymentReturnModel.fromJson(json.decode(str));

String paymentReturnModelToJson(PaymentReturnModel data) =>
    json.encode(data.toJson());

@freezed
class PaymentReturnModel with _$PaymentReturnModel {
  const factory PaymentReturnModel({
    PaymentReturnDetails? paymentReturnDetails,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _PaymentReturnModel;

  factory PaymentReturnModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentReturnModelFromJson(json);
}

@freezed
class PaymentReturnDetails with _$PaymentReturnDetails {
  const factory PaymentReturnDetails({
    String? LoginToken,
    String? EventCode,
    String? BookingSession,
    String? IsBookingCompleted,
  }) = _PaymentReturnDetails;

  factory PaymentReturnDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentReturnDetailsFromJson(json);
}
