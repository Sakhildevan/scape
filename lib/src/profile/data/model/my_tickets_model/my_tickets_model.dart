// To parse this JSON data, do
//
//     final myTicketsModel = myTicketsModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'my_tickets_model.g.dart';
part 'my_tickets_model.freezed.dart';

MyTicketsModel myTicketsModelFromJson(String str) =>
    MyTicketsModel.fromJson(json.decode(str));

String myTicketsModelToJson(MyTicketsModel data) => json.encode(data.toJson());

@freezed
class MyTicketsModel with _$MyTicketsModel {
  const factory MyTicketsModel({
    @JsonKey(name: "Tickets") List<Ticket>? tickets,
    @JsonKey(name: "IsSuccess") String? isSuccess,
    @JsonKey(name: "ErrorOnFailure") String? errorOnFailure,
  }) = _MyTicketsModel;

  factory MyTicketsModel.fromJson(Map<String, dynamic> json) =>
      _$MyTicketsModelFromJson(json);
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
    @JsonKey(name: "NextEventDate") String? nextEventDate,
    @JsonKey(name: "NextEventTime") String? nextEventTime,
    @JsonKey(name: "NextEventVenue") String? nextEventVenue,
    @JsonKey(name: "NumberOfPax") int? numberOfPax,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
