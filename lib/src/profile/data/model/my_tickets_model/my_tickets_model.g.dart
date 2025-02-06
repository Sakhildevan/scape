// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_tickets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyTicketsModelImpl _$$MyTicketsModelImplFromJson(Map<String, dynamic> json) =>
    _$MyTicketsModelImpl(
      tickets: (json['Tickets'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSuccess: json['IsSuccess'] as String?,
      errorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$MyTicketsModelImplToJson(
        _$MyTicketsModelImpl instance) =>
    <String, dynamic>{
      'Tickets': instance.tickets,
      'IsSuccess': instance.isSuccess,
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
      nextEventDate: json['NextEventDate'] as String?,
      nextEventTime: json['NextEventTime'] as String?,
      nextEventVenue: json['NextEventVenue'] as String?,
      numberOfPax: (json['NumberOfPax'] as num?)?.toInt(),
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
      'NextEventDate': instance.nextEventDate,
      'NextEventTime': instance.nextEventTime,
      'NextEventVenue': instance.nextEventVenue,
      'NumberOfPax': instance.numberOfPax,
    };
