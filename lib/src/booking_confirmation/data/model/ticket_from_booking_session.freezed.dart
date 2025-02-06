// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_from_booking_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketFromBookingSession _$TicketFromBookingSessionFromJson(
    Map<String, dynamic> json) {
  return _TicketFromBookingSession.fromJson(json);
}

/// @nodoc
mixin _$TicketFromBookingSession {
  String? get TicketCode => throw _privateConstructorUsedError;
  String? get IsSuccess => throw _privateConstructorUsedError;
  String? get ErrorOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketFromBookingSessionCopyWith<TicketFromBookingSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketFromBookingSessionCopyWith<$Res> {
  factory $TicketFromBookingSessionCopyWith(TicketFromBookingSession value,
          $Res Function(TicketFromBookingSession) then) =
      _$TicketFromBookingSessionCopyWithImpl<$Res, TicketFromBookingSession>;
  @useResult
  $Res call({String? TicketCode, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class _$TicketFromBookingSessionCopyWithImpl<$Res,
        $Val extends TicketFromBookingSession>
    implements $TicketFromBookingSessionCopyWith<$Res> {
  _$TicketFromBookingSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TicketCode = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      TicketCode: freezed == TicketCode
          ? _value.TicketCode
          : TicketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      IsSuccess: freezed == IsSuccess
          ? _value.IsSuccess
          : IsSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      ErrorOnFailure: freezed == ErrorOnFailure
          ? _value.ErrorOnFailure
          : ErrorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketFromBookingSessionImplCopyWith<$Res>
    implements $TicketFromBookingSessionCopyWith<$Res> {
  factory _$$TicketFromBookingSessionImplCopyWith(
          _$TicketFromBookingSessionImpl value,
          $Res Function(_$TicketFromBookingSessionImpl) then) =
      __$$TicketFromBookingSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? TicketCode, String? IsSuccess, String? ErrorOnFailure});
}

/// @nodoc
class __$$TicketFromBookingSessionImplCopyWithImpl<$Res>
    extends _$TicketFromBookingSessionCopyWithImpl<$Res,
        _$TicketFromBookingSessionImpl>
    implements _$$TicketFromBookingSessionImplCopyWith<$Res> {
  __$$TicketFromBookingSessionImplCopyWithImpl(
      _$TicketFromBookingSessionImpl _value,
      $Res Function(_$TicketFromBookingSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? TicketCode = freezed,
    Object? IsSuccess = freezed,
    Object? ErrorOnFailure = freezed,
  }) {
    return _then(_$TicketFromBookingSessionImpl(
      TicketCode: freezed == TicketCode
          ? _value.TicketCode
          : TicketCode // ignore: cast_nullable_to_non_nullable
              as String?,
      IsSuccess: freezed == IsSuccess
          ? _value.IsSuccess
          : IsSuccess // ignore: cast_nullable_to_non_nullable
              as String?,
      ErrorOnFailure: freezed == ErrorOnFailure
          ? _value.ErrorOnFailure
          : ErrorOnFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketFromBookingSessionImpl implements _TicketFromBookingSession {
  const _$TicketFromBookingSessionImpl(
      {this.TicketCode, this.IsSuccess, this.ErrorOnFailure});

  factory _$TicketFromBookingSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketFromBookingSessionImplFromJson(json);

  @override
  final String? TicketCode;
  @override
  final String? IsSuccess;
  @override
  final String? ErrorOnFailure;

  @override
  String toString() {
    return 'TicketFromBookingSession(TicketCode: $TicketCode, IsSuccess: $IsSuccess, ErrorOnFailure: $ErrorOnFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketFromBookingSessionImpl &&
            (identical(other.TicketCode, TicketCode) ||
                other.TicketCode == TicketCode) &&
            (identical(other.IsSuccess, IsSuccess) ||
                other.IsSuccess == IsSuccess) &&
            (identical(other.ErrorOnFailure, ErrorOnFailure) ||
                other.ErrorOnFailure == ErrorOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, TicketCode, IsSuccess, ErrorOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketFromBookingSessionImplCopyWith<_$TicketFromBookingSessionImpl>
      get copyWith => __$$TicketFromBookingSessionImplCopyWithImpl<
          _$TicketFromBookingSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketFromBookingSessionImplToJson(
      this,
    );
  }
}

abstract class _TicketFromBookingSession implements TicketFromBookingSession {
  const factory _TicketFromBookingSession(
      {final String? TicketCode,
      final String? IsSuccess,
      final String? ErrorOnFailure}) = _$TicketFromBookingSessionImpl;

  factory _TicketFromBookingSession.fromJson(Map<String, dynamic> json) =
      _$TicketFromBookingSessionImpl.fromJson;

  @override
  String? get TicketCode;
  @override
  String? get IsSuccess;
  @override
  String? get ErrorOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$TicketFromBookingSessionImplCopyWith<_$TicketFromBookingSessionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
