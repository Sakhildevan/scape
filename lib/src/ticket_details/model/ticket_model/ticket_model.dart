// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

TicketModel ticketModelFromJson(String str) =>
    TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

@freezed
class TicketModel with _$TicketModel {
  const factory TicketModel({
    @JsonKey(name: "ticket") Ticket? ticket,
    @JsonKey(name: "IsSuccess") String? isSuccess,
    @JsonKey(name: "TicketValidationMode") String? ticketValidationMode,
    @JsonKey(name: "ErrorOnFailure") String? errorOnFailure,
  }) = _TicketModel;

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);
}

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    @JsonKey(name: "TicketCode") String? ticketCode,
    @JsonKey(name: "BookedOn") String? bookedOn,
    @JsonKey(name: "EventName") String? eventName,
    @JsonKey(name: "EventDescription") String? eventDescription,
    @JsonKey(name: "BannerURL") String? bannerUrl,
    @JsonKey(name: "TicketPrice") int? ticketPrice,
    @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
    @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
    @JsonKey(name: "FinalPrice") int? finalPrice,
    @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
    @JsonKey(name: "TicketTermsAndConditions") String? ticketTermsAndConditions,
    @JsonKey(name: "TicketSpecialInstructions")
    String? ticketSpecialInstructions,
    @JsonKey(name: "ParticipantTickets")
    List<ParticipantTicket>? participantTickets,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}

@freezed
class ParticipantTicket with _$ParticipantTicket {
  const factory ParticipantTicket({
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
    @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
    @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
    @JsonKey(name: "TotalPrice") int? totalPrice,
    @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
  }) = _ParticipantTicket;

  factory ParticipantTicket.fromJson(Map<String, dynamic> json) =>
      _$ParticipantTicketFromJson(json);
}
