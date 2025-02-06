// To parse this JSON data, do
//
//     final dynamicTicketModel = dynamicTicketModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'dynamic_ticket_model.freezed.dart';
part 'dynamic_ticket_model.g.dart';

DynamicTicketModel dynamicTicketModelFromJson(String str) =>
    DynamicTicketModel.fromJson(json.decode(str));

String dynamicTicketModelToJson(DynamicTicketModel data) =>
    json.encode(data.toJson());

@freezed
class DynamicTicketModel with _$DynamicTicketModel {
  const factory DynamicTicketModel({
    String? DynamicParticipantTicketCode,
    String? DynamicParticipantTicketURL,
    String? DynamicParticipantTicketCodeIssuedOn,
    String? IsSuccess,
    String? ErrorOnFailure,
  }) = _DynamicTicketModel;

  factory DynamicTicketModel.fromJson(Map<String, dynamic> json) =>
      _$DynamicTicketModelFromJson(json);
}
