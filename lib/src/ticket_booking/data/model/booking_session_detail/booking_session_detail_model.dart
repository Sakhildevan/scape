// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'booking_session_detail_model.freezed.dart';
part 'booking_session_detail_model.g.dart';

BookingSessionDetailModel bookingSessionDetailModelFromJson(String str) =>
    BookingSessionDetailModel.fromJson(json.decode(str));

String bookingSessionDetailModelToJson(BookingSessionDetailModel data) =>
    json.encode(data.toJson());

@freezed
class BookingSessionDetailModel with _$BookingSessionDetailModel {
  const factory BookingSessionDetailModel({
    BookingSessionDeatils? bookingSessionDeatils,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _BookingSessionDetailModel;

  factory BookingSessionDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BookingSessionDetailModelFromJson(json);
}

@freezed
class BookingSessionDeatils with _$BookingSessionDeatils {
  const factory BookingSessionDeatils({
    String? BookingSession,
    String? BookedMemberFirstName,
    String? BookedMemberLastName,
    String? BookedMemberEmail,
    num? SubTotal,
    String? Promocode,
    num? PromocodeDiscount,
    num? MembershipDiscount,
    num? TotalCost,
    String? IsBookingCompleted,
    String? CompletedOn,
    List<BookedPackage>? BookedPackages,
  }) = _BookingSessionDeatils;

  factory BookingSessionDeatils.fromJson(Map<String, dynamic> json) =>
      _$BookingSessionDeatilsFromJson(json);
}

@freezed
class BookedPackage with _$BookedPackage {
  const factory BookedPackage({
    String? EventPackageCode,
    int? PackageCost,
    num? Quantity,
    num? TotalCost,
    List<Participant>? Participants,
  }) = _BookedPackage;

  factory BookedPackage.fromJson(Map<String, dynamic> json) =>
      _$BookedPackageFromJson(json);
}

@freezed
class Participant with _$Participant {
  const factory Participant({
    String? ParticipantCode,
    String? ParticipantName,
    String? ParticipantEmail,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}
