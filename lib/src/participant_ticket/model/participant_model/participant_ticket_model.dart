// To parse this JSON data, do
//
//     final participantTicketModel = participantTicketModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'participant_ticket_model.freezed.dart';
part 'participant_ticket_model.g.dart';

ParticipantTicketModel participantTicketModelFromJson(String str) =>
    ParticipantTicketModel.fromJson(json.decode(str));

String participantTicketModelToJson(ParticipantTicketModel data) =>
    json.encode(data.toJson());

@freezed
class ParticipantTicketModel with _$ParticipantTicketModel {
  const factory ParticipantTicketModel({
    @JsonKey(name: "participantTicket") ParticipantTicket? participantTicket,
    @JsonKey(name: "IsSuccess") String? isSuccess,
    @JsonKey(name: "TicketValidationMode") String? ticketValidationMode,
    @JsonKey(name: "ErrorOnFailure") String? errorOnFailure,
  }) = _ParticipantTicketModel;

  factory ParticipantTicketModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantTicketModelFromJson(json);
}

@freezed
class ParticipantTicket with _$ParticipantTicket {
  const factory ParticipantTicket({
    @JsonKey(name: "TicketCode") String? ticketCode,
    @JsonKey(name: "BookedOn") String? bookedOn,
    @JsonKey(name: "EventName") String? eventName,
    @JsonKey(name: "EventDescription") String? eventDescription,
    @JsonKey(name: "BannerURL") String? bannerUrl,
    @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
    @JsonKey(name: "TicketTermsAndConditions") String? ticketTermsAndConditions,
    @JsonKey(name: "TicketSpecialInstructions")
    String? ticketSpecialInstructions,
    @JsonKey(name: "ParticipantOnlyTickets")
    List<ParticipantOnlyTicket>? participantOnlyTickets,
  }) = _ParticipantTicket;

  factory ParticipantTicket.fromJson(Map<String, dynamic> json) =>
      _$ParticipantTicketFromJson(json);
}

@freezed
class ParticipantOnlyTicket with _$ParticipantOnlyTicket {
  const factory ParticipantOnlyTicket({
    @JsonKey(name: "ParticipantBookingReference")
    String? participantBookingReference,
    @JsonKey(name: "ParticipantTicketCode") String? participantTicketCode,
    @JsonKey(name: "ParticipantTicketURL") String? participantTicketURL,
    @JsonKey(name: "ParticipantName") String? participantName,
    @JsonKey(name: "ParticipantEmail") String? participantEmail,
    @JsonKey(name: "PackageName") String? packageName,
    @JsonKey(name: "PackageDescription") String? packageDescription,
    @JsonKey(name: "Venues") List<String>? venues,
    @JsonKey(name: "Price") int? price,
    @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
  }) = _ParticipantOnlyTicket;

  factory ParticipantOnlyTicket.fromJson(Map<String, dynamic> json) =>
      _$ParticipantOnlyTicketFromJson(json);
}
