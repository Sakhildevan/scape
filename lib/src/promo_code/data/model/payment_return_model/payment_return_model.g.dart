// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_return_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentReturnModelImpl _$$PaymentReturnModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentReturnModelImpl(
      paymentReturnDetails: json['paymentReturnDetails'] == null
          ? null
          : PaymentReturnDetails.fromJson(
              json['paymentReturnDetails'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$PaymentReturnModelImplToJson(
        _$PaymentReturnModelImpl instance) =>
    <String, dynamic>{
      'paymentReturnDetails': instance.paymentReturnDetails,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$PaymentReturnDetailsImpl _$$PaymentReturnDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentReturnDetailsImpl(
      LoginToken: json['LoginToken'] as String?,
      EventCode: json['EventCode'] as String?,
      BookingSession: json['BookingSession'] as String?,
      IsBookingCompleted: json['IsBookingCompleted'] as String?,
    );

Map<String, dynamic> _$$PaymentReturnDetailsImplToJson(
        _$PaymentReturnDetailsImpl instance) =>
    <String, dynamic>{
      'LoginToken': instance.LoginToken,
      'EventCode': instance.EventCode,
      'BookingSession': instance.BookingSession,
      'IsBookingCompleted': instance.IsBookingCompleted,
    };
