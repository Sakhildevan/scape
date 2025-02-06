import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ticket_from_booking_session.freezed.dart';
part 'ticket_from_booking_session.g.dart';

TicketFromBookingSession ticketFromBookingSessionModelFromJson(String str) =>
    TicketFromBookingSession.fromJson(json.decode(str));

String ticketFromBookingSessionModelToJson(TicketFromBookingSession data) =>
    json.encode(data.toJson());

@freezed
class TicketFromBookingSession with _$TicketFromBookingSession {
  const factory TicketFromBookingSession({
    String? TicketCode,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _TicketFromBookingSession;

  factory TicketFromBookingSession.fromJson(Map<String, dynamic> json) =>
      _$TicketFromBookingSessionFromJson(json);
}
