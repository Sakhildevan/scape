// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_participant_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketsParticipantListModelImpl _$$TicketsParticipantListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TicketsParticipantListModelImpl(
      listOfParticipants: (json['listOfParticipants'] as List<dynamic>?)
          ?.map((e) => ListOfParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TicketsParticipantListModelImplToJson(
        _$TicketsParticipantListModelImpl instance) =>
    <String, dynamic>{
      'listOfParticipants': instance.listOfParticipants,
    };

_$ListOfParticipantImpl _$$ListOfParticipantImplFromJson(
        Map<String, dynamic> json) =>
    _$ListOfParticipantImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ListOfParticipantImplToJson(
        _$ListOfParticipantImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
