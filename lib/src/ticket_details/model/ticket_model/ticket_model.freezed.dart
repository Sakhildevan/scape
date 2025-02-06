// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) {
  return _TicketModel.fromJson(json);
}

/// @nodoc
mixin _$TicketModel {
  @JsonKey(name: "ticket")
  Ticket? get ticket => throw _privateConstructorUsedError;
  @JsonKey(name: "IsSuccess")
  String? get isSuccess => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketValidationMode")
  String? get ticketValidationMode => throw _privateConstructorUsedError;
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketModelCopyWith<TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketModelCopyWith<$Res> {
  factory $TicketModelCopyWith(
          TicketModel value, $Res Function(TicketModel) then) =
      _$TicketModelCopyWithImpl<$Res, TicketModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "ticket") Ticket? ticket,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "TicketValidationMode") String? ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});

  $TicketCopyWith<$Res>? get ticket;
}

/// @nodoc
class _$TicketModelCopyWithImpl<$Res, $Val extends TicketModel>
    implements $TicketModelCopyWith<$Res> {
  _$TicketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = freezed,
    Object? isSuccess = freezed,
    Object? ticketValidationMode = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketValidationMode: freezed == ticketValidationMode
          ? _value.ticketValidationMode
          : ticketValidationMode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorOnFailure: freezed == errorOnFailure
          ? _value.errorOnFailure
          : errorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TicketCopyWith<$Res>? get ticket {
    if (_value.ticket == null) {
      return null;
    }

    return $TicketCopyWith<$Res>(_value.ticket!, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketModelImplCopyWith<$Res>
    implements $TicketModelCopyWith<$Res> {
  factory _$$TicketModelImplCopyWith(
          _$TicketModelImpl value, $Res Function(_$TicketModelImpl) then) =
      __$$TicketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ticket") Ticket? ticket,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "TicketValidationMode") String? ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});

  @override
  $TicketCopyWith<$Res>? get ticket;
}

/// @nodoc
class __$$TicketModelImplCopyWithImpl<$Res>
    extends _$TicketModelCopyWithImpl<$Res, _$TicketModelImpl>
    implements _$$TicketModelImplCopyWith<$Res> {
  __$$TicketModelImplCopyWithImpl(
      _$TicketModelImpl _value, $Res Function(_$TicketModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = freezed,
    Object? isSuccess = freezed,
    Object? ticketValidationMode = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_$TicketModelImpl(
      ticket: freezed == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketValidationMode: freezed == ticketValidationMode
          ? _value.ticketValidationMode
          : ticketValidationMode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorOnFailure: freezed == errorOnFailure
          ? _value.errorOnFailure
          : errorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketModelImpl implements _TicketModel {
  const _$TicketModelImpl(
      {@JsonKey(name: "ticket") this.ticket,
      @JsonKey(name: "IsSuccess") this.isSuccess,
      @JsonKey(name: "TicketValidationMode") this.ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure") this.errorOnFailure});

  factory _$TicketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketModelImplFromJson(json);

  @override
  @JsonKey(name: "ticket")
  final Ticket? ticket;
  @override
  @JsonKey(name: "IsSuccess")
  final String? isSuccess;
  @override
  @JsonKey(name: "TicketValidationMode")
  final String? ticketValidationMode;
  @override
  @JsonKey(name: "ErrorOnFailure")
  final String? errorOnFailure;

  @override
  String toString() {
    return 'TicketModel(ticket: $ticket, isSuccess: $isSuccess, ticketValidationMode: $ticketValidationMode, errorOnFailure: $errorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketModelImpl &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.ticketValidationMode, ticketValidationMode) ||
                other.ticketValidationMode == ticketValidationMode) &&
            (identical(other.errorOnFailure, errorOnFailure) ||
                other.errorOnFailure == errorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, ticket, isSuccess, ticketValidationMode, errorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketModelImplCopyWith<_$TicketModelImpl> get copyWith =>
      __$$TicketModelImplCopyWithImpl<_$TicketModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketModelImplToJson(
      this,
    );
  }
}

abstract class _TicketModel implements TicketModel {
  const factory _TicketModel(
      {@JsonKey(name: "ticket") final Ticket? ticket,
      @JsonKey(name: "IsSuccess") final String? isSuccess,
      @JsonKey(name: "TicketValidationMode") final String? ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure")
      final String? errorOnFailure}) = _$TicketModelImpl;

  factory _TicketModel.fromJson(Map<String, dynamic> json) =
      _$TicketModelImpl.fromJson;

  @override
  @JsonKey(name: "ticket")
  Ticket? get ticket;
  @override
  @JsonKey(name: "IsSuccess")
  String? get isSuccess;
  @override
  @JsonKey(name: "TicketValidationMode")
  String? get ticketValidationMode;
  @override
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$TicketModelImplCopyWith<_$TicketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  @JsonKey(name: "TicketCode")
  String? get ticketCode => throw _privateConstructorUsedError;
  @JsonKey(name: "BookedOn")
  String? get bookedOn => throw _privateConstructorUsedError;
  @JsonKey(name: "EventName")
  String? get eventName => throw _privateConstructorUsedError;
  @JsonKey(name: "EventDescription")
  String? get eventDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "BannerURL")
  String? get bannerUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketPrice")
  int? get ticketPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "PromocodeDiscount")
  int? get promocodeDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "MembershipDiscount")
  int? get membershipDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "FinalPrice")
  int? get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketTermsAndConditions")
  String? get ticketTermsAndConditions => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketSpecialInstructions")
  String? get ticketSpecialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: "ParticipantTickets")
  List<ParticipantTicket>? get participantTickets =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {@JsonKey(name: "TicketCode") String? ticketCode,
      @JsonKey(name: "BookedOn") String? bookedOn,
      @JsonKey(name: "EventName") String? eventName,
      @JsonKey(name: "EventDescription") String? eventDescription,
      @JsonKey(name: "BannerURL") String? bannerUrl,
      @JsonKey(name: "TicketPrice") int? ticketPrice,
      @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
      @JsonKey(name: "FinalPrice") int? finalPrice,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
      @JsonKey(name: "TicketTermsAndConditions")
      String? ticketTermsAndConditions,
      @JsonKey(name: "TicketSpecialInstructions")
      String? ticketSpecialInstructions,
      @JsonKey(name: "ParticipantTickets")
      List<ParticipantTicket>? participantTickets});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketCode = freezed,
    Object? bookedOn = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? bannerUrl = freezed,
    Object? ticketPrice = freezed,
    Object? promocodeDiscount = freezed,
    Object? membershipDiscount = freezed,
    Object? finalPrice = freezed,
    Object? isTicketCancelled = freezed,
    Object? ticketTermsAndConditions = freezed,
    Object? ticketSpecialInstructions = freezed,
    Object? participantTickets = freezed,
  }) {
    return _then(_value.copyWith(
      ticketCode: freezed == ticketCode
          ? _value.ticketCode
          : ticketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bookedOn: freezed == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketPrice: freezed == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      promocodeDiscount: freezed == promocodeDiscount
          ? _value.promocodeDiscount
          : promocodeDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipDiscount: freezed == membershipDiscount
          ? _value.membershipDiscount
          : membershipDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTermsAndConditions: freezed == ticketTermsAndConditions
          ? _value.ticketTermsAndConditions
          : ticketTermsAndConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketSpecialInstructions: freezed == ticketSpecialInstructions
          ? _value.ticketSpecialInstructions
          : ticketSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      participantTickets: freezed == participantTickets
          ? _value.participantTickets
          : participantTickets // ignore: cast_nullable_to_non_nullable
              as List<ParticipantTicket>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "TicketCode") String? ticketCode,
      @JsonKey(name: "BookedOn") String? bookedOn,
      @JsonKey(name: "EventName") String? eventName,
      @JsonKey(name: "EventDescription") String? eventDescription,
      @JsonKey(name: "BannerURL") String? bannerUrl,
      @JsonKey(name: "TicketPrice") int? ticketPrice,
      @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
      @JsonKey(name: "FinalPrice") int? finalPrice,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
      @JsonKey(name: "TicketTermsAndConditions")
      String? ticketTermsAndConditions,
      @JsonKey(name: "TicketSpecialInstructions")
      String? ticketSpecialInstructions,
      @JsonKey(name: "ParticipantTickets")
      List<ParticipantTicket>? participantTickets});
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketCode = freezed,
    Object? bookedOn = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? bannerUrl = freezed,
    Object? ticketPrice = freezed,
    Object? promocodeDiscount = freezed,
    Object? membershipDiscount = freezed,
    Object? finalPrice = freezed,
    Object? isTicketCancelled = freezed,
    Object? ticketTermsAndConditions = freezed,
    Object? ticketSpecialInstructions = freezed,
    Object? participantTickets = freezed,
  }) {
    return _then(_$TicketImpl(
      ticketCode: freezed == ticketCode
          ? _value.ticketCode
          : ticketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bookedOn: freezed == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescription: freezed == eventDescription
          ? _value.eventDescription
          : eventDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketPrice: freezed == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      promocodeDiscount: freezed == promocodeDiscount
          ? _value.promocodeDiscount
          : promocodeDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipDiscount: freezed == membershipDiscount
          ? _value.membershipDiscount
          : membershipDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTermsAndConditions: freezed == ticketTermsAndConditions
          ? _value.ticketTermsAndConditions
          : ticketTermsAndConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketSpecialInstructions: freezed == ticketSpecialInstructions
          ? _value.ticketSpecialInstructions
          : ticketSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      participantTickets: freezed == participantTickets
          ? _value._participantTickets
          : participantTickets // ignore: cast_nullable_to_non_nullable
              as List<ParticipantTicket>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {@JsonKey(name: "TicketCode") this.ticketCode,
      @JsonKey(name: "BookedOn") this.bookedOn,
      @JsonKey(name: "EventName") this.eventName,
      @JsonKey(name: "EventDescription") this.eventDescription,
      @JsonKey(name: "BannerURL") this.bannerUrl,
      @JsonKey(name: "TicketPrice") this.ticketPrice,
      @JsonKey(name: "PromocodeDiscount") this.promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") this.membershipDiscount,
      @JsonKey(name: "FinalPrice") this.finalPrice,
      @JsonKey(name: "IsTicketCancelled") this.isTicketCancelled,
      @JsonKey(name: "TicketTermsAndConditions") this.ticketTermsAndConditions,
      @JsonKey(name: "TicketSpecialInstructions")
      this.ticketSpecialInstructions,
      @JsonKey(name: "ParticipantTickets")
      final List<ParticipantTicket>? participantTickets})
      : _participantTickets = participantTickets;

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  @JsonKey(name: "TicketCode")
  final String? ticketCode;
  @override
  @JsonKey(name: "BookedOn")
  final String? bookedOn;
  @override
  @JsonKey(name: "EventName")
  final String? eventName;
  @override
  @JsonKey(name: "EventDescription")
  final String? eventDescription;
  @override
  @JsonKey(name: "BannerURL")
  final String? bannerUrl;
  @override
  @JsonKey(name: "TicketPrice")
  final int? ticketPrice;
  @override
  @JsonKey(name: "PromocodeDiscount")
  final int? promocodeDiscount;
  @override
  @JsonKey(name: "MembershipDiscount")
  final int? membershipDiscount;
  @override
  @JsonKey(name: "FinalPrice")
  final int? finalPrice;
  @override
  @JsonKey(name: "IsTicketCancelled")
  final String? isTicketCancelled;
  @override
  @JsonKey(name: "TicketTermsAndConditions")
  final String? ticketTermsAndConditions;
  @override
  @JsonKey(name: "TicketSpecialInstructions")
  final String? ticketSpecialInstructions;
  final List<ParticipantTicket>? _participantTickets;
  @override
  @JsonKey(name: "ParticipantTickets")
  List<ParticipantTicket>? get participantTickets {
    final value = _participantTickets;
    if (value == null) return null;
    if (_participantTickets is EqualUnmodifiableListView)
      return _participantTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Ticket(ticketCode: $ticketCode, bookedOn: $bookedOn, eventName: $eventName, eventDescription: $eventDescription, bannerUrl: $bannerUrl, ticketPrice: $ticketPrice, promocodeDiscount: $promocodeDiscount, membershipDiscount: $membershipDiscount, finalPrice: $finalPrice, isTicketCancelled: $isTicketCancelled, ticketTermsAndConditions: $ticketTermsAndConditions, ticketSpecialInstructions: $ticketSpecialInstructions, participantTickets: $participantTickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.ticketCode, ticketCode) ||
                other.ticketCode == ticketCode) &&
            (identical(other.bookedOn, bookedOn) ||
                other.bookedOn == bookedOn) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventDescription, eventDescription) ||
                other.eventDescription == eventDescription) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            (identical(other.promocodeDiscount, promocodeDiscount) ||
                other.promocodeDiscount == promocodeDiscount) &&
            (identical(other.membershipDiscount, membershipDiscount) ||
                other.membershipDiscount == membershipDiscount) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.isTicketCancelled, isTicketCancelled) ||
                other.isTicketCancelled == isTicketCancelled) &&
            (identical(
                    other.ticketTermsAndConditions, ticketTermsAndConditions) ||
                other.ticketTermsAndConditions == ticketTermsAndConditions) &&
            (identical(other.ticketSpecialInstructions,
                    ticketSpecialInstructions) ||
                other.ticketSpecialInstructions == ticketSpecialInstructions) &&
            const DeepCollectionEquality()
                .equals(other._participantTickets, _participantTickets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ticketCode,
      bookedOn,
      eventName,
      eventDescription,
      bannerUrl,
      ticketPrice,
      promocodeDiscount,
      membershipDiscount,
      finalPrice,
      isTicketCancelled,
      ticketTermsAndConditions,
      ticketSpecialInstructions,
      const DeepCollectionEquality().hash(_participantTickets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {@JsonKey(name: "TicketCode") final String? ticketCode,
      @JsonKey(name: "BookedOn") final String? bookedOn,
      @JsonKey(name: "EventName") final String? eventName,
      @JsonKey(name: "EventDescription") final String? eventDescription,
      @JsonKey(name: "BannerURL") final String? bannerUrl,
      @JsonKey(name: "TicketPrice") final int? ticketPrice,
      @JsonKey(name: "PromocodeDiscount") final int? promocodeDiscount,
      @JsonKey(name: "MembershipDiscount") final int? membershipDiscount,
      @JsonKey(name: "FinalPrice") final int? finalPrice,
      @JsonKey(name: "IsTicketCancelled") final String? isTicketCancelled,
      @JsonKey(name: "TicketTermsAndConditions")
      final String? ticketTermsAndConditions,
      @JsonKey(name: "TicketSpecialInstructions")
      final String? ticketSpecialInstructions,
      @JsonKey(name: "ParticipantTickets")
      final List<ParticipantTicket>? participantTickets}) = _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  @JsonKey(name: "TicketCode")
  String? get ticketCode;
  @override
  @JsonKey(name: "BookedOn")
  String? get bookedOn;
  @override
  @JsonKey(name: "EventName")
  String? get eventName;
  @override
  @JsonKey(name: "EventDescription")
  String? get eventDescription;
  @override
  @JsonKey(name: "BannerURL")
  String? get bannerUrl;
  @override
  @JsonKey(name: "TicketPrice")
  int? get ticketPrice;
  @override
  @JsonKey(name: "PromocodeDiscount")
  int? get promocodeDiscount;
  @override
  @JsonKey(name: "MembershipDiscount")
  int? get membershipDiscount;
  @override
  @JsonKey(name: "FinalPrice")
  int? get finalPrice;
  @override
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled;
  @override
  @JsonKey(name: "TicketTermsAndConditions")
  String? get ticketTermsAndConditions;
  @override
  @JsonKey(name: "TicketSpecialInstructions")
  String? get ticketSpecialInstructions;
  @override
  @JsonKey(name: "ParticipantTickets")
  List<ParticipantTicket>? get participantTickets;
  @override
  @JsonKey(ignore: true)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParticipantTicket _$ParticipantTicketFromJson(Map<String, dynamic> json) {
  return _ParticipantTicket.fromJson(json);
}

/// @nodoc
mixin _$ParticipantTicket {
  @JsonKey(name: "ParticipantBookingReference")
  String? get participantBookingReference => throw _privateConstructorUsedError;
  @JsonKey(name: "ParticipantTicketCode")
  String? get participantTicketCode => throw _privateConstructorUsedError;
  @JsonKey(name: "ParticipantTicketURL")
  String? get participantTicketURL => throw _privateConstructorUsedError;
  @JsonKey(name: "ParticipantName")
  String? get participantName => throw _privateConstructorUsedError;
  @JsonKey(name: "ParticipantEmail")
  String? get participantEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "PackageName")
  String? get packageName => throw _privateConstructorUsedError;
  @JsonKey(name: "PackageDescription")
  String? get packageDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "Venues")
  List<String>? get venues => throw _privateConstructorUsedError;
  @JsonKey(name: "Price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "MembershipDiscount")
  int? get membershipDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "PromocodeDiscount")
  int? get promocodeDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalPrice")
  int? get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantTicketCopyWith<ParticipantTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantTicketCopyWith<$Res> {
  factory $ParticipantTicketCopyWith(
          ParticipantTicket value, $Res Function(ParticipantTicket) then) =
      _$ParticipantTicketCopyWithImpl<$Res, ParticipantTicket>;
  @useResult
  $Res call(
      {@JsonKey(name: "ParticipantBookingReference")
      String? participantBookingReference,
      @JsonKey(name: "ParticipantTicketCode") String? participantTicketCode,
      @JsonKey(name: "ParticipantTicketURL") String? participantTicketURL,
      @JsonKey(name: "ParticipantName") String? participantName,
      @JsonKey(name: "ParticipantEmail") String? participantEmail,
      @JsonKey(name: "PackageName") String? packageName,
      @JsonKey(name: "PackageDescription") String? packageDescription,
      @JsonKey(name: "Venues") List<String>? venues,
      @JsonKey(name: "Price") int? price,
      @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
      @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
      @JsonKey(name: "TotalPrice") int? totalPrice,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled});
}

/// @nodoc
class _$ParticipantTicketCopyWithImpl<$Res, $Val extends ParticipantTicket>
    implements $ParticipantTicketCopyWith<$Res> {
  _$ParticipantTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantBookingReference = freezed,
    Object? participantTicketCode = freezed,
    Object? participantTicketURL = freezed,
    Object? participantName = freezed,
    Object? participantEmail = freezed,
    Object? packageName = freezed,
    Object? packageDescription = freezed,
    Object? venues = freezed,
    Object? price = freezed,
    Object? membershipDiscount = freezed,
    Object? promocodeDiscount = freezed,
    Object? totalPrice = freezed,
    Object? isTicketCancelled = freezed,
  }) {
    return _then(_value.copyWith(
      participantBookingReference: freezed == participantBookingReference
          ? _value.participantBookingReference
          : participantBookingReference // ignore: cast_nullable_to_non_nullable
              as String?,
      participantTicketCode: freezed == participantTicketCode
          ? _value.participantTicketCode
          : participantTicketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      participantTicketURL: freezed == participantTicketURL
          ? _value.participantTicketURL
          : participantTicketURL // ignore: cast_nullable_to_non_nullable
              as String?,
      participantName: freezed == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      participantEmail: freezed == participantEmail
          ? _value.participantEmail
          : participantEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      packageDescription: freezed == packageDescription
          ? _value.packageDescription
          : packageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      venues: freezed == venues
          ? _value.venues
          : venues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipDiscount: freezed == membershipDiscount
          ? _value.membershipDiscount
          : membershipDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      promocodeDiscount: freezed == promocodeDiscount
          ? _value.promocodeDiscount
          : promocodeDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantTicketImplCopyWith<$Res>
    implements $ParticipantTicketCopyWith<$Res> {
  factory _$$ParticipantTicketImplCopyWith(_$ParticipantTicketImpl value,
          $Res Function(_$ParticipantTicketImpl) then) =
      __$$ParticipantTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ParticipantBookingReference")
      String? participantBookingReference,
      @JsonKey(name: "ParticipantTicketCode") String? participantTicketCode,
      @JsonKey(name: "ParticipantTicketURL") String? participantTicketURL,
      @JsonKey(name: "ParticipantName") String? participantName,
      @JsonKey(name: "ParticipantEmail") String? participantEmail,
      @JsonKey(name: "PackageName") String? packageName,
      @JsonKey(name: "PackageDescription") String? packageDescription,
      @JsonKey(name: "Venues") List<String>? venues,
      @JsonKey(name: "Price") int? price,
      @JsonKey(name: "MembershipDiscount") int? membershipDiscount,
      @JsonKey(name: "PromocodeDiscount") int? promocodeDiscount,
      @JsonKey(name: "TotalPrice") int? totalPrice,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled});
}

/// @nodoc
class __$$ParticipantTicketImplCopyWithImpl<$Res>
    extends _$ParticipantTicketCopyWithImpl<$Res, _$ParticipantTicketImpl>
    implements _$$ParticipantTicketImplCopyWith<$Res> {
  __$$ParticipantTicketImplCopyWithImpl(_$ParticipantTicketImpl _value,
      $Res Function(_$ParticipantTicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantBookingReference = freezed,
    Object? participantTicketCode = freezed,
    Object? participantTicketURL = freezed,
    Object? participantName = freezed,
    Object? participantEmail = freezed,
    Object? packageName = freezed,
    Object? packageDescription = freezed,
    Object? venues = freezed,
    Object? price = freezed,
    Object? membershipDiscount = freezed,
    Object? promocodeDiscount = freezed,
    Object? totalPrice = freezed,
    Object? isTicketCancelled = freezed,
  }) {
    return _then(_$ParticipantTicketImpl(
      participantBookingReference: freezed == participantBookingReference
          ? _value.participantBookingReference
          : participantBookingReference // ignore: cast_nullable_to_non_nullable
              as String?,
      participantTicketCode: freezed == participantTicketCode
          ? _value.participantTicketCode
          : participantTicketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      participantTicketURL: freezed == participantTicketURL
          ? _value.participantTicketURL
          : participantTicketURL // ignore: cast_nullable_to_non_nullable
              as String?,
      participantName: freezed == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      participantEmail: freezed == participantEmail
          ? _value.participantEmail
          : participantEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      packageDescription: freezed == packageDescription
          ? _value.packageDescription
          : packageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      venues: freezed == venues
          ? _value._venues
          : venues // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      membershipDiscount: freezed == membershipDiscount
          ? _value.membershipDiscount
          : membershipDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      promocodeDiscount: freezed == promocodeDiscount
          ? _value.promocodeDiscount
          : promocodeDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantTicketImpl implements _ParticipantTicket {
  const _$ParticipantTicketImpl(
      {@JsonKey(name: "ParticipantBookingReference")
      this.participantBookingReference,
      @JsonKey(name: "ParticipantTicketCode") this.participantTicketCode,
      @JsonKey(name: "ParticipantTicketURL") this.participantTicketURL,
      @JsonKey(name: "ParticipantName") this.participantName,
      @JsonKey(name: "ParticipantEmail") this.participantEmail,
      @JsonKey(name: "PackageName") this.packageName,
      @JsonKey(name: "PackageDescription") this.packageDescription,
      @JsonKey(name: "Venues") final List<String>? venues,
      @JsonKey(name: "Price") this.price,
      @JsonKey(name: "MembershipDiscount") this.membershipDiscount,
      @JsonKey(name: "PromocodeDiscount") this.promocodeDiscount,
      @JsonKey(name: "TotalPrice") this.totalPrice,
      @JsonKey(name: "IsTicketCancelled") this.isTicketCancelled})
      : _venues = venues;

  factory _$ParticipantTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantTicketImplFromJson(json);

  @override
  @JsonKey(name: "ParticipantBookingReference")
  final String? participantBookingReference;
  @override
  @JsonKey(name: "ParticipantTicketCode")
  final String? participantTicketCode;
  @override
  @JsonKey(name: "ParticipantTicketURL")
  final String? participantTicketURL;
  @override
  @JsonKey(name: "ParticipantName")
  final String? participantName;
  @override
  @JsonKey(name: "ParticipantEmail")
  final String? participantEmail;
  @override
  @JsonKey(name: "PackageName")
  final String? packageName;
  @override
  @JsonKey(name: "PackageDescription")
  final String? packageDescription;
  final List<String>? _venues;
  @override
  @JsonKey(name: "Venues")
  List<String>? get venues {
    final value = _venues;
    if (value == null) return null;
    if (_venues is EqualUnmodifiableListView) return _venues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "Price")
  final int? price;
  @override
  @JsonKey(name: "MembershipDiscount")
  final int? membershipDiscount;
  @override
  @JsonKey(name: "PromocodeDiscount")
  final int? promocodeDiscount;
  @override
  @JsonKey(name: "TotalPrice")
  final int? totalPrice;
  @override
  @JsonKey(name: "IsTicketCancelled")
  final String? isTicketCancelled;

  @override
  String toString() {
    return 'ParticipantTicket(participantBookingReference: $participantBookingReference, participantTicketCode: $participantTicketCode, participantTicketURL: $participantTicketURL, participantName: $participantName, participantEmail: $participantEmail, packageName: $packageName, packageDescription: $packageDescription, venues: $venues, price: $price, membershipDiscount: $membershipDiscount, promocodeDiscount: $promocodeDiscount, totalPrice: $totalPrice, isTicketCancelled: $isTicketCancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantTicketImpl &&
            (identical(other.participantBookingReference,
                    participantBookingReference) ||
                other.participantBookingReference ==
                    participantBookingReference) &&
            (identical(other.participantTicketCode, participantTicketCode) ||
                other.participantTicketCode == participantTicketCode) &&
            (identical(other.participantTicketURL, participantTicketURL) ||
                other.participantTicketURL == participantTicketURL) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.participantEmail, participantEmail) ||
                other.participantEmail == participantEmail) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.packageDescription, packageDescription) ||
                other.packageDescription == packageDescription) &&
            const DeepCollectionEquality().equals(other._venues, _venues) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.membershipDiscount, membershipDiscount) ||
                other.membershipDiscount == membershipDiscount) &&
            (identical(other.promocodeDiscount, promocodeDiscount) ||
                other.promocodeDiscount == promocodeDiscount) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.isTicketCancelled, isTicketCancelled) ||
                other.isTicketCancelled == isTicketCancelled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      participantBookingReference,
      participantTicketCode,
      participantTicketURL,
      participantName,
      participantEmail,
      packageName,
      packageDescription,
      const DeepCollectionEquality().hash(_venues),
      price,
      membershipDiscount,
      promocodeDiscount,
      totalPrice,
      isTicketCancelled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantTicketImplCopyWith<_$ParticipantTicketImpl> get copyWith =>
      __$$ParticipantTicketImplCopyWithImpl<_$ParticipantTicketImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantTicketImplToJson(
      this,
    );
  }
}

abstract class _ParticipantTicket implements ParticipantTicket {
  const factory _ParticipantTicket(
      {@JsonKey(name: "ParticipantBookingReference")
      final String? participantBookingReference,
      @JsonKey(name: "ParticipantTicketCode")
      final String? participantTicketCode,
      @JsonKey(name: "ParticipantTicketURL") final String? participantTicketURL,
      @JsonKey(name: "ParticipantName") final String? participantName,
      @JsonKey(name: "ParticipantEmail") final String? participantEmail,
      @JsonKey(name: "PackageName") final String? packageName,
      @JsonKey(name: "PackageDescription") final String? packageDescription,
      @JsonKey(name: "Venues") final List<String>? venues,
      @JsonKey(name: "Price") final int? price,
      @JsonKey(name: "MembershipDiscount") final int? membershipDiscount,
      @JsonKey(name: "PromocodeDiscount") final int? promocodeDiscount,
      @JsonKey(name: "TotalPrice") final int? totalPrice,
      @JsonKey(name: "IsTicketCancelled")
      final String? isTicketCancelled}) = _$ParticipantTicketImpl;

  factory _ParticipantTicket.fromJson(Map<String, dynamic> json) =
      _$ParticipantTicketImpl.fromJson;

  @override
  @JsonKey(name: "ParticipantBookingReference")
  String? get participantBookingReference;
  @override
  @JsonKey(name: "ParticipantTicketCode")
  String? get participantTicketCode;
  @override
  @JsonKey(name: "ParticipantTicketURL")
  String? get participantTicketURL;
  @override
  @JsonKey(name: "ParticipantName")
  String? get participantName;
  @override
  @JsonKey(name: "ParticipantEmail")
  String? get participantEmail;
  @override
  @JsonKey(name: "PackageName")
  String? get packageName;
  @override
  @JsonKey(name: "PackageDescription")
  String? get packageDescription;
  @override
  @JsonKey(name: "Venues")
  List<String>? get venues;
  @override
  @JsonKey(name: "Price")
  int? get price;
  @override
  @JsonKey(name: "MembershipDiscount")
  int? get membershipDiscount;
  @override
  @JsonKey(name: "PromocodeDiscount")
  int? get promocodeDiscount;
  @override
  @JsonKey(name: "TotalPrice")
  int? get totalPrice;
  @override
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantTicketImplCopyWith<_$ParticipantTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
