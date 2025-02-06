// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_session_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingSessionDetailModelImpl _$$BookingSessionDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingSessionDetailModelImpl(
      bookingSessionDeatils: json['bookingSessionDeatils'] == null
          ? null
          : BookingSessionDeatils.fromJson(
              json['bookingSessionDeatils'] as Map<String, dynamic>),
      IsSuccess: json['IsSuccess'] as String?,
      ErrorOnFailure: json['ErrorOnFailure'] as String?,
    );

Map<String, dynamic> _$$BookingSessionDetailModelImplToJson(
        _$BookingSessionDetailModelImpl instance) =>
    <String, dynamic>{
      'bookingSessionDeatils': instance.bookingSessionDeatils,
      'IsSuccess': instance.IsSuccess,
      'ErrorOnFailure': instance.ErrorOnFailure,
    };

_$BookingSessionDeatilsImpl _$$BookingSessionDeatilsImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingSessionDeatilsImpl(
      BookingSession: json['BookingSession'] as String?,
      BookedMemberFirstName: json['BookedMemberFirstName'] as String?,
      BookedMemberLastName: json['BookedMemberLastName'] as String?,
      BookedMemberEmail: json['BookedMemberEmail'] as String?,
      SubTotal: json['SubTotal'] as num?,
      Promocode: json['Promocode'] as String?,
      PromocodeDiscount: json['PromocodeDiscount'] as num?,
      MembershipDiscount: json['MembershipDiscount'] as num?,
      TotalCost: json['TotalCost'] as num?,
      IsBookingCompleted: json['IsBookingCompleted'] as String?,
      CompletedOn: json['CompletedOn'] as String?,
      BookedPackages: (json['BookedPackages'] as List<dynamic>?)
          ?.map((e) => BookedPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookingSessionDeatilsImplToJson(
        _$BookingSessionDeatilsImpl instance) =>
    <String, dynamic>{
      'BookingSession': instance.BookingSession,
      'BookedMemberFirstName': instance.BookedMemberFirstName,
      'BookedMemberLastName': instance.BookedMemberLastName,
      'BookedMemberEmail': instance.BookedMemberEmail,
      'SubTotal': instance.SubTotal,
      'Promocode': instance.Promocode,
      'PromocodeDiscount': instance.PromocodeDiscount,
      'MembershipDiscount': instance.MembershipDiscount,
      'TotalCost': instance.TotalCost,
      'IsBookingCompleted': instance.IsBookingCompleted,
      'CompletedOn': instance.CompletedOn,
      'BookedPackages': instance.BookedPackages,
    };

_$BookedPackageImpl _$$BookedPackageImplFromJson(Map<String, dynamic> json) =>
    _$BookedPackageImpl(
      EventPackageCode: json['EventPackageCode'] as String?,
      PackageCost: (json['PackageCost'] as num?)?.toInt(),
      Quantity: json['Quantity'] as num?,
      TotalCost: json['TotalCost'] as num?,
      Participants: (json['Participants'] as List<dynamic>?)
          ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookedPackageImplToJson(_$BookedPackageImpl instance) =>
    <String, dynamic>{
      'EventPackageCode': instance.EventPackageCode,
      'PackageCost': instance.PackageCost,
      'Quantity': instance.Quantity,
      'TotalCost': instance.TotalCost,
      'Participants': instance.Participants,
    };

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      ParticipantCode: json['ParticipantCode'] as String?,
      ParticipantName: json['ParticipantName'] as String?,
      ParticipantEmail: json['ParticipantEmail'] as String?,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'ParticipantCode': instance.ParticipantCode,
      'ParticipantName': instance.ParticipantName,
      'ParticipantEmail': instance.ParticipantEmail,
    };
