// To parse this JSON data, do
//
//     final ticketsParticipantListModel = ticketsParticipantListModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'tickets_participant_list_model.freezed.dart';
part 'tickets_participant_list_model.g.dart';

List<TicketsParticipantListModel> ticketsParticipantListModelFromJson(
        String str) =>
    List<TicketsParticipantListModel>.from(
        json.decode(str).map((x) => TicketsParticipantListModel.fromJson(x)));

String ticketsParticipantListModelToJson(
        List<TicketsParticipantListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class TicketsParticipantListModel with _$TicketsParticipantListModel {
  const factory TicketsParticipantListModel({
    List<ListOfParticipant>? listOfParticipants,
  }) = _TicketsParticipantListModel;

  factory TicketsParticipantListModel.fromJson(Map<String, dynamic> json) =>
      _$TicketsParticipantListModelFromJson(json);
}

@freezed
class ListOfParticipant with _$ListOfParticipant {
  const factory ListOfParticipant({
    String? name,
    String? email,
  }) = _ListOfParticipant;

  factory ListOfParticipant.fromJson(Map<String, dynamic> json) =>
      _$ListOfParticipantFromJson(json);
}
