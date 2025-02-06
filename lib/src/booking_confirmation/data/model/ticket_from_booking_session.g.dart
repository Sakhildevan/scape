// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_from_booking_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketFromBookingSessionImpl _$$TicketFromBookingSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$TicketFromBookingSessionImpl(
      TicketCode: json['TicketCode'] as String?,
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$TicketFromBookingSessionImplToJson(
        _$TicketFromBookingSessionImpl instance) =>
    <String, dynamic>{
      'TicketCode': instance.TicketCode,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };
