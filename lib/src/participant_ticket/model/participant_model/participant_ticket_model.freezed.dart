// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParticipantTicketModel _$ParticipantTicketModelFromJson(
    Map<String, dynamic> json) {
  return _ParticipantTicketModel.fromJson(json);
}

/// @nodoc
mixin _$ParticipantTicketModel {
  @JsonKey(name: "participantTicket")
  ParticipantTicket? get participantTicket =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "IsSuccess")
  String? get isSuccess => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketValidationMode")
  String? get ticketValidationMode => throw _privateConstructorUsedError;
  @JsonKey(name: "ErrorOnFailure")
  String? get errorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantTicketModelCopyWith<ParticipantTicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantTicketModelCopyWith<$Res> {
  factory $ParticipantTicketModelCopyWith(ParticipantTicketModel value,
          $Res Function(ParticipantTicketModel) then) =
      _$ParticipantTicketModelCopyWithImpl<$Res, ParticipantTicketModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "participantTicket") ParticipantTicket? participantTicket,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "TicketValidationMode") String? ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});

  $ParticipantTicketCopyWith<$Res>? get participantTicket;
}

/// @nodoc
class _$ParticipantTicketModelCopyWithImpl<$Res,
        $Val extends ParticipantTicketModel>
    implements $ParticipantTicketModelCopyWith<$Res> {
  _$ParticipantTicketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantTicket = freezed,
    Object? isSuccess = freezed,
    Object? ticketValidationMode = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      participantTicket: freezed == participantTicket
          ? _value.participantTicket
          : participantTicket // ignore: cast_nullable_to_non_nullable
              as ParticipantTicket?,
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
  $ParticipantTicketCopyWith<$Res>? get participantTicket {
    if (_value.participantTicket == null) {
      return null;
    }

    return $ParticipantTicketCopyWith<$Res>(_value.participantTicket!, (value) {
      return _then(_value.copyWith(participantTicket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParticipantTicketModelImplCopyWith<$Res>
    implements $ParticipantTicketModelCopyWith<$Res> {
  factory _$$ParticipantTicketModelImplCopyWith(
          _$ParticipantTicketModelImpl value,
          $Res Function(_$ParticipantTicketModelImpl) then) =
      __$$ParticipantTicketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "participantTicket") ParticipantTicket? participantTicket,
      @JsonKey(name: "IsSuccess") String? isSuccess,
      @JsonKey(name: "TicketValidationMode") String? ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure") String? errorOnFailure});

  @override
  $ParticipantTicketCopyWith<$Res>? get participantTicket;
}

/// @nodoc
class __$$ParticipantTicketModelImplCopyWithImpl<$Res>
    extends _$ParticipantTicketModelCopyWithImpl<$Res,
        _$ParticipantTicketModelImpl>
    implements _$$ParticipantTicketModelImplCopyWith<$Res> {
  __$$ParticipantTicketModelImplCopyWithImpl(
      _$ParticipantTicketModelImpl _value,
      $Res Function(_$ParticipantTicketModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantTicket = freezed,
    Object? isSuccess = freezed,
    Object? ticketValidationMode = freezed,
    Object? errorOnFailure = freezed,
  }) {
    return _then(_$ParticipantTicketModelImpl(
      participantTicket: freezed == participantTicket
          ? _value.participantTicket
          : participantTicket // ignore: cast_nullable_to_non_nullable
              as ParticipantTicket?,
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
class _$ParticipantTicketModelImpl implements _ParticipantTicketModel {
  const _$ParticipantTicketModelImpl(
      {@JsonKey(name: "participantTicket") this.participantTicket,
      @JsonKey(name: "IsSuccess") this.isSuccess,
      @JsonKey(name: "TicketValidationMode") this.ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure") this.errorOnFailure});

  factory _$ParticipantTicketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantTicketModelImplFromJson(json);

  @override
  @JsonKey(name: "participantTicket")
  final ParticipantTicket? participantTicket;
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
    return 'ParticipantTicketModel(participantTicket: $participantTicket, isSuccess: $isSuccess, ticketValidationMode: $ticketValidationMode, errorOnFailure: $errorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantTicketModelImpl &&
            (identical(other.participantTicket, participantTicket) ||
                other.participantTicket == participantTicket) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.ticketValidationMode, ticketValidationMode) ||
                other.ticketValidationMode == ticketValidationMode) &&
            (identical(other.errorOnFailure, errorOnFailure) ||
                other.errorOnFailure == errorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, participantTicket, isSuccess,
      ticketValidationMode, errorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantTicketModelImplCopyWith<_$ParticipantTicketModelImpl>
      get copyWith => __$$ParticipantTicketModelImplCopyWithImpl<
          _$ParticipantTicketModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantTicketModelImplToJson(
      this,
    );
  }
}

abstract class _ParticipantTicketModel implements ParticipantTicketModel {
  const factory _ParticipantTicketModel(
      {@JsonKey(name: "participantTicket")
      final ParticipantTicket? participantTicket,
      @JsonKey(name: "IsSuccess") final String? isSuccess,
      @JsonKey(name: "TicketValidationMode") final String? ticketValidationMode,
      @JsonKey(name: "ErrorOnFailure")
      final String? errorOnFailure}) = _$ParticipantTicketModelImpl;

  factory _ParticipantTicketModel.fromJson(Map<String, dynamic> json) =
      _$ParticipantTicketModelImpl.fromJson;

  @override
  @JsonKey(name: "participantTicket")
  ParticipantTicket? get participantTicket;
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
  _$$ParticipantTicketModelImplCopyWith<_$ParticipantTicketModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ParticipantTicket _$ParticipantTicketFromJson(Map<String, dynamic> json) {
  return _ParticipantTicket.fromJson(json);
}

/// @nodoc
mixin _$ParticipantTicket {
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
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketTermsAndConditions")
  String? get ticketTermsAndConditions => throw _privateConstructorUsedError;
  @JsonKey(name: "TicketSpecialInstructions")
  String? get ticketSpecialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: "ParticipantOnlyTickets")
  List<ParticipantOnlyTicket>? get participantOnlyTickets =>
      throw _privateConstructorUsedError;

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
      {@JsonKey(name: "TicketCode") String? ticketCode,
      @JsonKey(name: "BookedOn") String? bookedOn,
      @JsonKey(name: "EventName") String? eventName,
      @JsonKey(name: "EventDescription") String? eventDescription,
      @JsonKey(name: "BannerURL") String? bannerUrl,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
      @JsonKey(name: "TicketTermsAndConditions")
      String? ticketTermsAndConditions,
      @JsonKey(name: "TicketSpecialInstructions")
      String? ticketSpecialInstructions,
      @JsonKey(name: "ParticipantOnlyTickets")
      List<ParticipantOnlyTicket>? participantOnlyTickets});
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
    Object? ticketCode = freezed,
    Object? bookedOn = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? bannerUrl = freezed,
    Object? isTicketCancelled = freezed,
    Object? ticketTermsAndConditions = freezed,
    Object? ticketSpecialInstructions = freezed,
    Object? participantOnlyTickets = freezed,
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
      participantOnlyTickets: freezed == participantOnlyTickets
          ? _value.participantOnlyTickets
          : participantOnlyTickets // ignore: cast_nullable_to_non_nullable
              as List<ParticipantOnlyTicket>?,
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
      {@JsonKey(name: "TicketCode") String? ticketCode,
      @JsonKey(name: "BookedOn") String? bookedOn,
      @JsonKey(name: "EventName") String? eventName,
      @JsonKey(name: "EventDescription") String? eventDescription,
      @JsonKey(name: "BannerURL") String? bannerUrl,
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled,
      @JsonKey(name: "TicketTermsAndConditions")
      String? ticketTermsAndConditions,
      @JsonKey(name: "TicketSpecialInstructions")
      String? ticketSpecialInstructions,
      @JsonKey(name: "ParticipantOnlyTickets")
      List<ParticipantOnlyTicket>? participantOnlyTickets});
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
    Object? ticketCode = freezed,
    Object? bookedOn = freezed,
    Object? eventName = freezed,
    Object? eventDescription = freezed,
    Object? bannerUrl = freezed,
    Object? isTicketCancelled = freezed,
    Object? ticketTermsAndConditions = freezed,
    Object? ticketSpecialInstructions = freezed,
    Object? participantOnlyTickets = freezed,
  }) {
    return _then(_$ParticipantTicketImpl(
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
      participantOnlyTickets: freezed == participantOnlyTickets
          ? _value._participantOnlyTickets
          : participantOnlyTickets // ignore: cast_nullable_to_non_nullable
              as List<ParticipantOnlyTicket>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantTicketImpl implements _ParticipantTicket {
  const _$ParticipantTicketImpl(
      {@JsonKey(name: "TicketCode") this.ticketCode,
      @JsonKey(name: "BookedOn") this.bookedOn,
      @JsonKey(name: "EventName") this.eventName,
      @JsonKey(name: "EventDescription") this.eventDescription,
      @JsonKey(name: "BannerURL") this.bannerUrl,
      @JsonKey(name: "IsTicketCancelled") this.isTicketCancelled,
      @JsonKey(name: "TicketTermsAndConditions") this.ticketTermsAndConditions,
      @JsonKey(name: "TicketSpecialInstructions")
      this.ticketSpecialInstructions,
      @JsonKey(name: "ParticipantOnlyTickets")
      final List<ParticipantOnlyTicket>? participantOnlyTickets})
      : _participantOnlyTickets = participantOnlyTickets;

  factory _$ParticipantTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantTicketImplFromJson(json);

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
  @JsonKey(name: "IsTicketCancelled")
  final String? isTicketCancelled;
  @override
  @JsonKey(name: "TicketTermsAndConditions")
  final String? ticketTermsAndConditions;
  @override
  @JsonKey(name: "TicketSpecialInstructions")
  final String? ticketSpecialInstructions;
  final List<ParticipantOnlyTicket>? _participantOnlyTickets;
  @override
  @JsonKey(name: "ParticipantOnlyTickets")
  List<ParticipantOnlyTicket>? get participantOnlyTickets {
    final value = _participantOnlyTickets;
    if (value == null) return null;
    if (_participantOnlyTickets is EqualUnmodifiableListView)
      return _participantOnlyTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ParticipantTicket(ticketCode: $ticketCode, bookedOn: $bookedOn, eventName: $eventName, eventDescription: $eventDescription, bannerUrl: $bannerUrl, isTicketCancelled: $isTicketCancelled, ticketTermsAndConditions: $ticketTermsAndConditions, ticketSpecialInstructions: $ticketSpecialInstructions, participantOnlyTickets: $participantOnlyTickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantTicketImpl &&
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
            (identical(other.isTicketCancelled, isTicketCancelled) ||
                other.isTicketCancelled == isTicketCancelled) &&
            (identical(
                    other.ticketTermsAndConditions, ticketTermsAndConditions) ||
                other.ticketTermsAndConditions == ticketTermsAndConditions) &&
            (identical(other.ticketSpecialInstructions,
                    ticketSpecialInstructions) ||
                other.ticketSpecialInstructions == ticketSpecialInstructions) &&
            const DeepCollectionEquality().equals(
                other._participantOnlyTickets, _participantOnlyTickets));
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
      isTicketCancelled,
      ticketTermsAndConditions,
      ticketSpecialInstructions,
      const DeepCollectionEquality().hash(_participantOnlyTickets));

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
          {@JsonKey(name: "TicketCode") final String? ticketCode,
          @JsonKey(name: "BookedOn") final String? bookedOn,
          @JsonKey(name: "EventName") final String? eventName,
          @JsonKey(name: "EventDescription") final String? eventDescription,
          @JsonKey(name: "BannerURL") final String? bannerUrl,
          @JsonKey(name: "IsTicketCancelled") final String? isTicketCancelled,
          @JsonKey(name: "TicketTermsAndConditions")
          final String? ticketTermsAndConditions,
          @JsonKey(name: "TicketSpecialInstructions")
          final String? ticketSpecialInstructions,
          @JsonKey(name: "ParticipantOnlyTickets")
          final List<ParticipantOnlyTicket>? participantOnlyTickets}) =
      _$ParticipantTicketImpl;

  factory _ParticipantTicket.fromJson(Map<String, dynamic> json) =
      _$ParticipantTicketImpl.fromJson;

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
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled;
  @override
  @JsonKey(name: "TicketTermsAndConditions")
  String? get ticketTermsAndConditions;
  @override
  @JsonKey(name: "TicketSpecialInstructions")
  String? get ticketSpecialInstructions;
  @override
  @JsonKey(name: "ParticipantOnlyTickets")
  List<ParticipantOnlyTicket>? get participantOnlyTickets;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantTicketImplCopyWith<_$ParticipantTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParticipantOnlyTicket _$ParticipantOnlyTicketFromJson(
    Map<String, dynamic> json) {
  return _ParticipantOnlyTicket.fromJson(json);
}

/// @nodoc
mixin _$ParticipantOnlyTicket {
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
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantOnlyTicketCopyWith<ParticipantOnlyTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantOnlyTicketCopyWith<$Res> {
  factory $ParticipantOnlyTicketCopyWith(ParticipantOnlyTicket value,
          $Res Function(ParticipantOnlyTicket) then) =
      _$ParticipantOnlyTicketCopyWithImpl<$Res, ParticipantOnlyTicket>;
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
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled});
}

/// @nodoc
class _$ParticipantOnlyTicketCopyWithImpl<$Res,
        $Val extends ParticipantOnlyTicket>
    implements $ParticipantOnlyTicketCopyWith<$Res> {
  _$ParticipantOnlyTicketCopyWithImpl(this._value, this._then);

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
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantOnlyTicketImplCopyWith<$Res>
    implements $ParticipantOnlyTicketCopyWith<$Res> {
  factory _$$ParticipantOnlyTicketImplCopyWith(
          _$ParticipantOnlyTicketImpl value,
          $Res Function(_$ParticipantOnlyTicketImpl) then) =
      __$$ParticipantOnlyTicketImplCopyWithImpl<$Res>;
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
      @JsonKey(name: "IsTicketCancelled") String? isTicketCancelled});
}

/// @nodoc
class __$$ParticipantOnlyTicketImplCopyWithImpl<$Res>
    extends _$ParticipantOnlyTicketCopyWithImpl<$Res,
        _$ParticipantOnlyTicketImpl>
    implements _$$ParticipantOnlyTicketImplCopyWith<$Res> {
  __$$ParticipantOnlyTicketImplCopyWithImpl(_$ParticipantOnlyTicketImpl _value,
      $Res Function(_$ParticipantOnlyTicketImpl) _then)
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
    Object? isTicketCancelled = freezed,
  }) {
    return _then(_$ParticipantOnlyTicketImpl(
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
      isTicketCancelled: freezed == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantOnlyTicketImpl implements _ParticipantOnlyTicket {
  const _$ParticipantOnlyTicketImpl(
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
      @JsonKey(name: "IsTicketCancelled") this.isTicketCancelled})
      : _venues = venues;

  factory _$ParticipantOnlyTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantOnlyTicketImplFromJson(json);

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
  @JsonKey(name: "IsTicketCancelled")
  final String? isTicketCancelled;

  @override
  String toString() {
    return 'ParticipantOnlyTicket(participantBookingReference: $participantBookingReference, participantTicketCode: $participantTicketCode, participantTicketURL: $participantTicketURL, participantName: $participantName, participantEmail: $participantEmail, packageName: $packageName, packageDescription: $packageDescription, venues: $venues, price: $price, isTicketCancelled: $isTicketCancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantOnlyTicketImpl &&
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
      isTicketCancelled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantOnlyTicketImplCopyWith<_$ParticipantOnlyTicketImpl>
      get copyWith => __$$ParticipantOnlyTicketImplCopyWithImpl<
          _$ParticipantOnlyTicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantOnlyTicketImplToJson(
      this,
    );
  }
}

abstract class _ParticipantOnlyTicket implements ParticipantOnlyTicket {
  const factory _ParticipantOnlyTicket(
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
      @JsonKey(name: "IsTicketCancelled")
      final String? isTicketCancelled}) = _$ParticipantOnlyTicketImpl;

  factory _ParticipantOnlyTicket.fromJson(Map<String, dynamic> json) =
      _$ParticipantOnlyTicketImpl.fromJson;

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
  @JsonKey(name: "IsTicketCancelled")
  String? get isTicketCancelled;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantOnlyTicketImplCopyWith<_$ParticipantOnlyTicketImpl>
      get copyWith => throw _privateConstructorUsedError;
}
