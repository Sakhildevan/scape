// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DynamicTicketModelImpl _$$DynamicTicketModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DynamicTicketModelImpl(
      DynamicParticipantTicketCode:
          json['DynamicParticipantTicketCode'] as String?,
      DynamicParticipantTicketURL:
          json['DynamicParticipantTicketURL'] as String?,
      DynamicParticipantTicketCodeIssuedOn:
          json['DynamicParticipantTicketCodeIssuedOn'] as String?,
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$DynamicTicketModelImplToJson(
        _$DynamicTicketModelImpl instance) =>
    <String, dynamic>{
      'DynamicParticipantTicketCode': instance.DynamicParticipantTicketCode,
      'DynamicParticipantTicketURL': instance.DynamicParticipantTicketURL,
      'DynamicParticipantTicketCodeIssuedOn':
          instance.DynamicParticipantTicketCodeIssuedOn,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };
