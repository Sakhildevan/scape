// To parse this JSON data, do
//
//     final isBookingFreeModel = isBookingFreeModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'is_free_booking_model.freezed.dart';
part 'is_free_booking_model.g.dart';

IsBookingFreeModel isBookingFreeModelFromJson(String str) => IsBookingFreeModel.fromJson(json.decode(str));

String isBookingFreeModelToJson(IsBookingFreeModel data) => json.encode(data.toJson());

@freezed
class IsBookingFreeModel with _$IsBookingFreeModel {
  const factory IsBookingFreeModel({
    String? IsFree,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _IsBookingFreeModel;

  factory IsBookingFreeModel.fromJson(Map<String, dynamic> json) => _$IsBookingFreeModelFromJson(json);
}
