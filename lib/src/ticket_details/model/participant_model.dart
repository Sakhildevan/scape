// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ParticipantModel extends Equatable {
  final int participantNumber;
  final String name;
  final String ticketInfo;
  final String qrCode;
  final String eventInfo;
  final String dateTime;
  const ParticipantModel({
    required this.participantNumber,
    required this.name,
    required this.ticketInfo,
    required this.qrCode,
    required this.eventInfo,
    required this.dateTime,
  });

  ParticipantModel copyWith({
    int? participantNumber,
    String? name,
    String? ticketInfo,
    String? qrCode,
    String? eventInfo,
    String? dateTime,
  }) {
    return ParticipantModel(
      participantNumber: participantNumber ?? this.participantNumber,
      name: name ?? this.name,
      ticketInfo: ticketInfo ?? this.ticketInfo,
      qrCode: qrCode ?? this.qrCode,
      eventInfo: eventInfo ?? this.eventInfo,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'participantNumber': participantNumber,
      'name': name,
      'ticketInfo': ticketInfo,
      'qrCode': qrCode,
      'eventInfo': eventInfo,
      'dateTime': dateTime,
    };
  }

  factory ParticipantModel.fromMap(Map<String, dynamic> map) {
    return ParticipantModel(
      participantNumber: map['participantNumber'] as int,
      name: map['name'] as String,
      ticketInfo: map['ticketInfo'] as String,
      qrCode: map['qrCode'] as String,
      eventInfo: map['eventInfo'] as String,
      dateTime: map['dateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantModel.fromJson(String source) =>
      ParticipantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      participantNumber,
      name,
      ticketInfo,
      qrCode,
      eventInfo,
      dateTime,
    ];
  }
}
