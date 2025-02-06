// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateNewSessionModelImpl _$$CreateNewSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateNewSessionModelImpl(
      bookingSessionDetails: json['bookingSessionDetails'] == null
          ? null
          : BookingSessionDetails.fromJson(
              json['bookingSessionDetails'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$CreateNewSessionModelImplToJson(
        _$CreateNewSessionModelImpl instance) =>
    <String, dynamic>{
      'bookingSessionDetails': instance.bookingSessionDetails,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$BookingSessionDetailsImpl _$$BookingSessionDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingSessionDetailsImpl(
      BookingSession: json['BookingSession'] as String?,
    );

Map<String, dynamic> _$$BookingSessionDetailsImplToJson(
        _$BookingSessionDetailsImpl instance) =>
    <String, dynamic>{
      'BookingSession': instance.BookingSession,
    };
