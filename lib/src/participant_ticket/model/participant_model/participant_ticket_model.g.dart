// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantTicketModelImpl _$$ParticipantTicketModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantTicketModelImpl(
      participantTicket: json['participantTicket'] == null
          ? null
          : ParticipantTicket.fromJson(
              json['participantTicket'] as Map<String, dynamic>),
      isSuccess: json['IsSuccess'] as String?,
      ticketValidationMode: json['TicketValidationMode'] as String?,
      errorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$ParticipantTicketModelImplToJson(
        _$ParticipantTicketModelImpl instance) =>
    <String, dynamic>{
      'participantTicket': instance.participantTicket,
      'IsSuccess': instance.isSuccess,
      'TicketValidationMode': instance.ticketValidationMode,
      'ErrorOnFailure': instance.errorOnFailure,
    };

_$ParticipantTicketImpl _$$ParticipantTicketImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantTicketImpl(
      ticketCode: json['TicketCode'] as String?,
      bookedOn: json['BookedOn'] as String?,
      eventName: json['EventName'] as String?,
      eventDescription: json['EventDescription'] as String?,
      bannerUrl: json['BannerURL'] as String?,
      isTicketCancelled: json['IsTicketCancelled'] as String?,
      ticketTermsAndConditions: json['TicketTermsAndConditions'] as String?,
      ticketSpecialInstructions: json['TicketSpecialInstructions'] as String?,
      participantOnlyTickets: (json['ParticipantOnlyTickets'] as List<dynamic>?)
          ?.map(
              (e) => ParticipantOnlyTicket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ParticipantTicketImplToJson(
        _$ParticipantTicketImpl instance) =>
    <String, dynamic>{
      'TicketCode': instance.ticketCode,
      'BookedOn': instance.bookedOn,
      'EventName': instance.eventName,
      'EventDescription': instance.eventDescription,
      'BannerURL': instance.bannerUrl,
      'IsTicketCancelled': instance.isTicketCancelled,
      'TicketTermsAndConditions': instance.ticketTermsAndConditions,
      'TicketSpecialInstructions': instance.ticketSpecialInstructions,
      'ParticipantOnlyTickets': instance.participantOnlyTickets,
    };

_$ParticipantOnlyTicketImpl _$$ParticipantOnlyTicketImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantOnlyTicketImpl(
      participantBookingReference:
          json['ParticipantBookingReference'] as String?,
      participantTicketCode: json['ParticipantTicketCode'] as String?,
      participantTicketURL: json['ParticipantTicketURL'] as String?,
      participantName: json['ParticipantName'] as String?,
      participantEmail: json['ParticipantEmail'] as String?,
      packageName: json['PackageName'] as String?,
      packageDescription: json['PackageDescription'] as String?,
      venues:
          (json['Venues'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['Price'] as num?)?.toInt(),
      isTicketCancelled: json['IsTicketCancelled'] as String?,
    );

Map<String, dynamic> _$$ParticipantOnlyTicketImplToJson(
        _$ParticipantOnlyTicketImpl instance) =>
    <String, dynamic>{
      'ParticipantBookingReference': instance.participantBookingReference,
      'ParticipantTicketCode': instance.participantTicketCode,
      'ParticipantTicketURL': instance.participantTicketURL,
      'ParticipantName': instance.participantName,
      'ParticipantEmail': instance.participantEmail,
      'PackageName': instance.packageName,
      'PackageDescription': instance.packageDescription,
      'Venues': instance.venues,
      'Price': instance.price,
      'IsTicketCancelled': instance.isTicketCancelled,
    };
