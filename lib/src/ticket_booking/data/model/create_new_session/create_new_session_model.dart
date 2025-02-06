// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_new_session_model.freezed.dart';
part 'create_new_session_model.g.dart';

CreateNewSessionModel eventModelFromJson(String str) =>
    CreateNewSessionModel.fromJson(json.decode(str));

String eventModelToJson(CreateNewSessionModel data) =>
    json.encode(data.toJson());

@freezed
class CreateNewSessionModel with _$CreateNewSessionModel {
  const factory CreateNewSessionModel({
    BookingSessionDetails? bookingSessionDetails,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _CreateNewSessionModel;

  factory CreateNewSessionModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewSessionModelFromJson(json);
}

@freezed
class BookingSessionDetails with _$BookingSessionDetails {
  const factory BookingSessionDetails({
    String? BookingSession,
  }) = _BookingSessionDetails;

  factory BookingSessionDetails.fromJson(Map<String, dynamic> json) =>
      _$BookingSessionDetailsFromJson(json);
}
