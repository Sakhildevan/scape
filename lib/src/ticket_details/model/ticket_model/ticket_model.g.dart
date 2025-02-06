// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketModelImpl _$$TicketModelImplFromJson(Map<String, dynamic> json) =>
    _$TicketModelImpl(
      ticket: json['ticket'] == null
          ? null
          : Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
      isSuccess: json['IsSuccess'] as String?,
      ticketValidationMode: json['TicketValidationMode'] as String?,
      errorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$TicketModelImplToJson(_$TicketModelImpl instance) =>
    <String, dynamic>{
      'ticket': instance.ticket,
      'IsSuccess': instance.isSuccess,
      'TicketValidationMode': instance.ticketValidationMode,
      'ErrorOnFailure': instance.errorOnFailure,
    };

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => _$TicketImpl(
      ticketCode: json['TicketCode'] as String?,
      bookedOn: json['BookedOn'] as String?,
      eventName: json['EventName'] as String?,
      eventDescription: json['EventDescription'] as String?,
      bannerUrl: json['BannerURL'] as String?,
      ticketPrice: (json['TicketPrice'] as num?)?.toInt(),
      promocodeDiscount: (json['PromocodeDiscount'] as num?)?.toInt(),
      membershipDiscount: (json['MembershipDiscount'] as num?)?.toInt(),
      finalPrice: (json['FinalPrice'] as num?)?.toInt(),
      isTicketCancelled: json['IsTicketCancelled'] as String?,
      ticketTermsAndConditions: json['TicketTermsAndConditions'] as String?,
      ticketSpecialInstructions: json['TicketSpecialInstructions'] as String?,
      participantTickets: (json['ParticipantTickets'] as List<dynamic>?)
          ?.map((e) => ParticipantTicket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      'TicketCode': instance.ticketCode,
      'BookedOn': instance.bookedOn,
      'EventName': instance.eventName,
      'EventDescription': instance.eventDescription,
      'BannerURL': instance.bannerUrl,
      'TicketPrice': instance.ticketPrice,
      'PromocodeDiscount': instance.promocodeDiscount,
      'MembershipDiscount': instance.membershipDiscount,
      'FinalPrice': instance.finalPrice,
      'IsTicketCancelled': instance.isTicketCancelled,
      'TicketTermsAndConditions': instance.ticketTermsAndConditions,
      'TicketSpecialInstructions': instance.ticketSpecialInstructions,
      'ParticipantTickets': instance.participantTickets,
    };

_$ParticipantTicketImpl _$$ParticipantTicketImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantTicketImpl(
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
      membershipDiscount: (json['MembershipDiscount'] as num?)?.toInt(),
      promocodeDiscount: (json['PromocodeDiscount'] as num?)?.toInt(),
      totalPrice: (json['TotalPrice'] as num?)?.toInt(),
      isTicketCancelled: json['IsTicketCancelled'] as String?,
    );

Map<String, dynamic> _$$ParticipantTicketImplToJson(
        _$ParticipantTicketImpl instance) =>
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
      'MembershipDiscount': instance.membershipDiscount,
      'PromocodeDiscount': instance.promocodeDiscount,
      'TotalPrice': instance.totalPrice,
      'IsTicketCancelled': instance.isTicketCancelled,
    };
