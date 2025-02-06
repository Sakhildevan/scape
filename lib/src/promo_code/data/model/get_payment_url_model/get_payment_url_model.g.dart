// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPaymentUrlModelImpl _$$GetPaymentUrlModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPaymentUrlModelImpl(
      PaymentRedirectURL: json['PaymentRedirectURL'] as String?,
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$GetPaymentUrlModelImplToJson(
        _$GetPaymentUrlModelImpl instance) =>
    <String, dynamic>{
      'PaymentRedirectURL': instance.PaymentRedirectURL,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };
